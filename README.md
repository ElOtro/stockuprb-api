## App

This is an application that is used to create and store your invoices even if you have many organisations and bank accounts.

Implementation in Golang (Go) <a href="https://github.com/ElOtro/stockupgo-api">here</a>

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

## FAQ

Why do I use the jsonb type in bank_accounts, contacts? 

Let's think about a bank account. You maybe have multiple bank accounts. The one is a national currency account, other is dollar account. They definitely may have different attributes, so to make your life easier, it would be nice define them in the jsonb type.

What are start_at, end_at in agreements for?

To store "history" changing company contacts.

## TODO

- Dockerize
- Project stages
- Printable invoice in PDF (Prawn) 