class CreateAgreements < ActiveRecord::Migration[6.1]
  def change
    create_table :agreements, comment: "Agreements" do |t|
      t.references :company, null: false, index: true
      t.date       :start_at, comment: "Date of start"
      t.date       :end_at, comment: "Date of end"
      t.string     :name, comment: "Name of Agreement"
      t.references :user,  index: true, comment: "Creator"
      t.datetime   :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
