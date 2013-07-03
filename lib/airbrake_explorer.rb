module AirbrakeExplorer
  ROOT_PATH    = File.expand_path(File.join('..', '..'), __FILE__)
  LIBRARY_PATH = File.join(ROOT_PATH, 'lib', 'airbrake_explorer')

  require File.join LIBRARY_PATH, 'application'
end