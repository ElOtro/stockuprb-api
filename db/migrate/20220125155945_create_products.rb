class CreateProducts < ActiveRecord::Migration[6.1]
  def up
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

    # products
    execute "drop trigger if exists product_search on products"
    execute <<-EOS
      CREATE OR REPLACE FUNCTION full_search_for_products() RETURNS trigger LANGUAGE plpgsql AS $$
      begin
       new.search_vector :=
          setweight(to_tsvector('pg_catalog.simple', coalesce(new.name, '')), 'A')               ||
          setweight(to_tsvector('pg_catalog.simple', coalesce(new.sku, '')), 'A')                ||
          setweight(to_tsvector('pg_catalog.simple', coalesce(new.description, '')), 'B');

        return new;
      end
      $$;
    EOS

    execute <<-EOS
      CREATE TRIGGER product_search BEFORE INSERT OR UPDATE
        ON products FOR EACH ROW EXECUTE PROCEDURE full_search_for_products();
    EOS
    # end products
  end

  def down
    drop_table :products
    execute "drop trigger if exists product_search on products"
    execute "drop function if exists full_search_for_products()" 
  end

end
