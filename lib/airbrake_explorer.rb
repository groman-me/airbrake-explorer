module AirbrakeExplorer
  ROOT_PATH    = File.expand_path(File.join('..', '..'), __FILE__)
  LIBRARY_PATH = File.join(ROOT_PATH, 'lib', 'airbrake_explorer')
  PUBLIC_PATH  = File.join(ROOT_PATH, 'public')

  require File.join LIBRARY_PATH, 'application'
end