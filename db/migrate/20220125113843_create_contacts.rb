class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :company, null: false, index: true
      t.integer    :role, default: 1, comment: "Role"
      t.string     :title, comment: "Title"
      t.string     :name, comment: "Name"
      t.string     :phone, comment: "Phone"
      t.string     :email, comment: "Email"
      t.datetime   :start_at, index: true
      t.string     :sign, comment: "Image object, uses for printable documents"
      t.jsonb      :details, default: {}, comment: "To store additional information"
      t.references :user, index: true, comment: "Creator"
      t.datetime   :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
