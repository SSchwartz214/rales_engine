require 'csv'

namespace :import do
  desc "imports CSV files"
  task all: :environment do
    def seed_data(path, data_type)
      raw_input = CSV.open(path, headers: true, header_converters: :symbol)
      raw_input.each do |pre_hash|
        data = pre_hash.to_h
        data_type.create(data)
      end
    end

    seed_data("./data/customers.csv", Customer)
    seed_data("./data/merchants.csv", Merchant)
    seed_data("./data/invoices.csv", Invoice)
    seed_data("./data/items.csv", Item)
    seed_data("./data/invoice_items.csv", InvoiceItem)
    seed_data("./data/transactions.csv", Transaction)

  end

end
