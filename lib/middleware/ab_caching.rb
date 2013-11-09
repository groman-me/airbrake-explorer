require 'faraday_middleware/response/caching'

module Middleware
  # FIXME: overriding caching behavior for hard-coded endpoints
  # Public: Caches GET responses and pulls subsequent ones from the cache.
  class AbCaching < FaradayMiddleware::Caching
    def call(env)
      if :get == env[:method]
        if env[:parallel_manager]
          # callback mode
          cache_on_complete(env)
        else
          # synchronous mode
          response = cache.fetch(cache_key(env), expire_lists(env)) { @app.call(env) }
          finalize_response(response, env)
        end
      else
        @app.call(env)
      end
    end

    def expire_lists(env)
      if cache_key(env) =~ /\/groups.xml|\/notices.xml/
        puts cache_key(env)
        { expires_in: 5.minute }
      end
    end
  end
end
