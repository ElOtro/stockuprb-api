class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :company, null: false, index: true
      t.integer    :role, default: 1
      t.string     :title
      t.string     :name
      t.string     :phone
      t.string     :email
      t.datetime   :start_at, index: true
      t.string     :sign
      t.jsonb      :details, default: {}
      t.references :user, index: true
      t.datetime   :destroyed_at, index: true

      t.timestamps
    end
  end
end
