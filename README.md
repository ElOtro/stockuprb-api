## App

This is an application that is used to create and store your invoices even if you have many organisations and bank accounts.

Database schema: <a href="https://github.com/ElOtro/stockuprb-api/blob/master/erd.pdf">erd.pdf</a>

If you are comfortable with Postman, download collection <a href="StockUp.postman_collection.json">StockUp</a>

## Dependencies

- Rspec
- Devise
- Faker
- PostgreSQL
- Kaminari
- JWT

## How to run

rake db:create db:migrate and then rails s

If you want to fill database tables with test data, run: 
rake db:seed

## TODO

- Dockerize 