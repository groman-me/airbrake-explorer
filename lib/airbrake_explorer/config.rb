require 'singleton'
require 'airbrake_explorer/airbrake_config'

module AirbrakeExplorer
  class Config
    include Singleton
    extend Forwardable

    def_delegator :airbrake, :credentials, :ab_credentials

    def airbrake
      AirbrakeConfig.new File.join(AirbrakeExplorer::CONFIG_PATH, 'airbrake.yml')
    end

  end
end
