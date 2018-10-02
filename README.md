### Тестовое задание

#### Установка и запуск

 - `vagrant up && vagrant ssh`
 - выполнить миграции `rake db:migrate` и `RACK_ENV=test rake db:migrate`
 - запустить тесты `bundle exec rspec`
 - запустить приложение `bundle exec ruby app.rb`
 
#### Описание

http://localhost:4000/ - страница для рассчёта стоимости

http://localhost:4000/top3 - топ три отправителя (откуда)
