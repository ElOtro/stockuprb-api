class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.boolean    :is_active, default: false
      t.integer    :product_type
      t.string     :name
      t.text       :description
      t.string     :sku
      t.decimal    :price
      t.references :vat_rate, null: false,  index: true
      t.references :unit, null: false,  index: true
      t.references :user,  index: true, comment: "Creator"
      t.tsvector   :search_vector, index: true, using: :gin
      t.datetime   :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
