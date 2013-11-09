require 'yaml'
require 'airbrake-api'
require 'active_support/logger'
require 'active_support/cache'
require 'airbrake_explorer/core_ext/hash'

class AirbrakeConfig

  def initialize(config_file_path)
    @config_file_path = config_file_path
  end

  def credentials
    default_options.merge(from_config_file).symbolize_keys!
  end

protected

  def default_options
    {
      secure: true,
      user_agent: 'AirbrakeExplorer',
      middleware: AirbrakeAPI::Configuration::DEFAULT_MIDDLEWARE + cache_middleware
    }
  end

  def from_config_file
    YAML.load_file @config_file_path
  end

  def cache_middleware
    [
      [
        FaradayMiddleware::Caching,
        ActiveSupport::Cache::FileStore.
          new(AirbrakeExplorer::CACHE_PATH,
              :namespace => from_config_file['account'] #, :expires_in => 300
        ),
        { :ignore_params => %w[auth_token] }
      ],
      Faraday::Response::Logger
    ]
  end
end
