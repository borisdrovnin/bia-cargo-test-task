LOGGER = Logger.new(STDOUT)
LOGGER.level = ENV['CT_LOG_LEVEL'] || Logger::DEBUG
LOGGER.formatter = lambda do |severity, datetime, _progname, msg|
  "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} #{severity}: #{msg}\n"
end
