$root = __dir__

require_relative 'config/app_init'

# Запускаем сервис, если не находимся в тестовом режиме
service = CargoTask::API::HTTP
service.run! unless service.environment == :test || Kernel.const_defined?('IRB')
