class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'uuid-ossp'
    create_table :organisations do |t|
      t.string    :name
      t.string    :full_name
      t.string    :ceo
      t.string    :ceo_title
      t.string    :cfo
      t.string    :cfo_title
      t.string    :stamp
      t.string    :ceo_sign
      t.string    :cfo_sign
      t.boolean   :is_vat_payer, default: false
      t.jsonb     :details, default: {}
      t.datetime  :destroyed_at, index: true

      t.timestamps
    end
  end
end
