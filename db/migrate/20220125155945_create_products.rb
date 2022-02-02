class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, comment: "Products" do |t|
      t.boolean    :is_active, default: false, comment: "Visible or not"
      t.integer    :product_type, comment: "Product Type (category)"
      t.string     :name, comment: "Name"
      t.text       :description, comment: "Description, default value"
      t.string     :sku, comment: "SKU of Product"
      t.decimal    :price, comment: "Price of Product"
      t.references :vat_rate, null: false,  index: true, comment: "VAT, default value"
      t.references :unit, null: false,  index: true, comment: "Unit, default value"
      t.references :user,  index: true, comment: "Creator"
      t.tsvector   :search_vector, index: true, using: :gin
      t.datetime   :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
