class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string     :logo
      t.string     :name
      t.string     :full_name
      t.integer    :company_type, default: 1
      t.jsonb      :details, default: {}
      t.references :user,  index: true
      t.datetime   :destroyed_at, index: true

      t.timestamps
    end
  end
end
