class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies, comment: "Companies" do |t|
      t.string     :logo
      t.string     :name, comment: "Short name of Company"
      t.string     :full_name, comment: "Full name name of Company"
      t.integer    :company_type, default: 1, comment: "Type of Company"
      t.jsonb      :details, default: {}, comment: "To store additional information"
      t.references :user,  index: true, comment: "Creator"
      t.datetime   :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
