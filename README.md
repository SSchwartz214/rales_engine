# README

### RalesEngine

#### Description

Rales Engine uses Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema.


#### Rails version: 5.1.6

### Configuration

* Clone the repository:
```
git clone https://github.com/SSchwartz214/rales_engine.git
```

* Navigate to the repository:
```
cd rales_engine
```

* Open text editor:
```
ie: If you are using Atom, type: Atom .
```

* To install gems:
```
$ bundle install
$ bundle update
```

* To create and seed database:
```
$ rake db:{create,migrate}
$ rake import:all
```

* How to run the test suite
```
$ rspec
```

* Endpoints
```
You can visit these endpoints to see a JSON response.

In your terminal, start a local server: rails s

Open your browser to localhost:3000
```
** Record Endpoints

* Merchants
GET /api/v1/merchants
GET /api/v1/merchants/:id
GET /api/v1/merchants/random

* Customers
GET /api/v1/customers
GET /api/v1/customers/:id
GET /api/v1/customers/random

* Items
GET /api/v1/items
GET /api/v1/items/:id
GET /api/v1/items/random

* Invoices
GET /api/v1/invoices
GET /api/v1/invoices/:id
GET /api/v1/invoices/random

* Invoice_Items
GET /api/v1/invoice_items
GET /api/v1/invoice_items/:id
GET /api/v1/invoice_items/random

* Transactions
GET /api/v1/transactions
GET /api/v1/transactions/:id
GET /api/v1/transactions/random

* Relationship Endpoints
Merchants
GET /api/v1/merchants/:id/items returns a collection of items associated with that merchant
GET /api/v1/merchants/:id/invoices returns a collection of invoices associated with that merchant from their known orders

* Invoices
GET /api/v1/invoices/:id/transactions returns a collection of associated transactions
GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items
GET /api/v1/invoices/:id/items returns a collection of associated items
GET /api/v1/invoices/:id/customer returns the associated customer
GET /api/v1/invoices/:id/merchant returns the associated merchant

* Invoice Items
GET /api/v1/invoice_items/:id/invoice returns the associated invoice
GET /api/v1/invoice_items/:id/item returns the associated item

* Items
GET /api/v1/items/:id/invoice_items returns a collection of associated invoice items
GET /api/v1/items/:id/merchant returns the associated merchant

* Transactions
GET /api/v1/transactions/:id/invoice returns the associated invoice

* Customers
GET /api/v1/customers/:id/invoices returns a collection of associated invoices
GET /api/v1/customers/:id/transactions returns a collection of associated transactions

* Business Intelligence Endpoints

* Merchants
GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue
GET /api/v1/merchants/most_items?quantity=x returns the top x merchants ranked by total number of items sold
GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants
GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions
GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.

* Items
GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated
GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold
GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

* Customers
GET /api/v1/customers/:id/favorite_merchant returns a merchant where the customer has conducted the most successful transactions

#### Questions or comments?

Please contact us at:

* Seth: https://github.com/SSchwartz214
* Connor: https://github.com/letsdothis64

