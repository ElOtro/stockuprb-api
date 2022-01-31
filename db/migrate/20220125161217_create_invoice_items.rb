class CreateInvoiceItems < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, null: false, index: true
      t.integer    :position, default: 0
      t.references :product, null: false, index: true
      t.text       :description
      t.references :unit, null: false,  index: true
      t.decimal    :quantity, precision: 8, scale: 3, default: 0.0
      t.decimal    :price, precision: 15, scale: 2, default: 0.0
      t.decimal    :amount, precision: 15, scale: 2, default: 0.0
      t.decimal    :discount_rate, precision: 15, scale: 2, default: 0.0
      t.decimal    :discount, precision: 15, scale: 2, default: 0.0
      t.references :vat_rate, null: false,  index: true
      t.decimal    :vat, precision: 15, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
