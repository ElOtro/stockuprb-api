class CreateVatRates < ActiveRecord::Migration[6.1]
  def change
    create_table :vat_rates do |t|
      t.boolean  :is_active, default: false
      t.boolean  :is_default, default: false
      t.decimal  :rate, precision: 15, scale: 2, default: 0.0
      t.string   :name
      t.datetime :destroyed_at, index: true

      t.timestamps
    end
  end
end
