class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'uuid-ossp'
    create_table :organisations, comment: "Organisations" do |t|
      t.string    :name, comment: "Short name of organisation"
      t.string    :full_name, comment: "Full name of organisation"
      t.string    :ceo, comment: "CEO of organisation"
      t.string    :ceo_title, comment: "CEO's title"
      t.string    :cfo, comment: "CFO"
      t.string    :cfo_title, comment: "CFO's title"
      t.string    :stamp, comment: "Image object, uses for printable documents"
      t.string    :ceo_sign, comment: "Image object, uses for printable documents"
      t.string    :cfo_sign, comment: "Image object, uses for printable documents"
      t.boolean   :is_vat_payer, default: false, comment: "Use VAT"
      t.jsonb     :details, default: {}, comment: "To store additional information"
      t.datetime  :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
