module AirbrakeExplorer
  ROOT_PATH    = File.expand_path(File.join('..', '..'), __FILE__)
  LIBRARY_PATH = File.join(ROOT_PATH, 'lib')
  PUBLIC_PATH  = File.join(ROOT_PATH, 'public')
  CONFIG_PATH  = File.join(ROOT_PATH, 'config')
  CACHE_PATH   = File.join(ROOT_PATH, 'cache')

  $LOAD_PATH << LIBRARY_PATH

  %w[sinatra/application_helper
     airbrake_explorer/filter_collection
     airbrake_explorer/config
     airbrake_explorer/application
    ].each { |file| require file }

end
