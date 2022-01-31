class CreateInvoices < ActiveRecord::Migration[6.1]
  def up
    create_table :invoices do |t|
      t.boolean    :is_active, default: false
      t.datetime   :date, index: true
      t.string     :number, index: true
      t.references :organisation, null: false, index: true
      t.references :bank_account, null: false, index: true
      t.references :company, null: false, index: true
      t.references :agreement, null: false, index: true
      t.references :project, index: true
      t.decimal    :amount, precision: 15, scale: 2, default: 0.0
      t.decimal    :discount, precision: 15, scale: 2, default: 0.0
      t.decimal    :vat, precision: 15, scale: 2, default: 0.0
      t.references :user, index: true
      t.tsvector   :search_vector, index: true, using: :gin
      t.datetime   :destroyed_at, index: true

      t.timestamps
    end

    # invoices
    execute "drop trigger if exists invoice_search on invoices"
    execute <<-EOS
    CREATE OR REPLACE FUNCTION full_search_for_invoices() RETURNS trigger AS $$
    declare
      companies record;
      agreements record;
    begin
      select name into companies from companies where (id = new.company_id);
      select name into agreements from agreements where (id = new.agreement_id);
    
      new.search_vector :=
          setweight(to_tsvector('pg_catalog.simple', coalesce(new.number, '')), 'A') ||
          setweight(to_tsvector('pg_catalog.simple', coalesce(companies.name, '')), 'B') ||
          setweight(to_tsvector('pg_catalog.simple', coalesce(replace(agreements.name, '-', ' '), '')), 'B');
        return new;
      end
    $$ LANGUAGE plpgsql;
    EOS

    execute <<-EOS
    CREATE TRIGGER invoice_search BEFORE INSERT OR UPDATE 
    ON invoices 
    FOR EACH ROW EXECUTE PROCEDURE full_search_for_invoices();
    EOS
    # end invoices

  end

  def down
    drop_table :invoices
    execute "drop trigger if exists invoice_search on invoices"
    execute "drop function if exists full_search_for_invoices()" 
  end
end
