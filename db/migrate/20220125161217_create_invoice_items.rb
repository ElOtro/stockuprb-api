class CreateInvoiceItems < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, null: false, index: true
      t.integer    :position, default: 0, comment: "Order for a list"
      t.references :product, null: false, index: true, comment: "Product"
      t.text       :description, comment: "Custom description, default from Product"
      t.references :unit, null: false,  index: true, comment: "Unit"
      t.decimal    :quantity, precision: 8, scale: 3, default: 0.0, comment: "Quantity"
      t.decimal    :price, precision: 15, scale: 2, default: 0.0, comment: "Price"
      t.decimal    :amount, precision: 15, scale: 2, default: 0.0, comment: "Amount, Quantity * Price"
      t.decimal    :discount_rate, precision: 15, scale: 2, default: 0.0, comment: "Discount, percent"
      t.decimal    :discount, precision: 15, scale: 2, default: 0.0, comment: "Discount, amount"
      t.references :vat_rate, null: false,  index: true, comment: "VAT rate"
      t.decimal    :vat, precision: 15, scale: 2, default: 0.0, comment: "Amount of VAT"

      t.timestamps
    end
  end
end
