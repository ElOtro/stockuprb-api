class CreateVatRates < ActiveRecord::Migration[6.1]
  def change
    create_table :vat_rates, comment: "Vat Rates" do |t|
      t.boolean  :is_active, default: false, comment: "Visible or not"
      t.boolean  :is_default, default: false, comment: "Default or not"
      t.decimal  :rate, precision: 15, scale: 2, default: 0.0, comment: "Rate of VAT"
      t.string   :name, comment: "Presentation of VAT"
      t.datetime :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
