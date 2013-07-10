require 'yaml'
require File.join AirbrakeExplorer::LIBRARY_PATH, 'core_ext', 'hash'

class AirbrakeConfig

  def initialize(config_file_path)
    @config_file_path = config_file_path
  end

  def credentials
    default_options.merge(from_config_file).symbolize_keys!
  end

protected

  def default_options
    { secure: true }
  end

  def from_config_file
    YAML.load_file @config_file_path
  end

end
