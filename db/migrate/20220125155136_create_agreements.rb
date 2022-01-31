class CreateAgreements < ActiveRecord::Migration[6.1]
  def change
    create_table :agreements do |t|
      t.references :company, null: false, index: true
      t.date       :start_at
      t.date       :end_at
      t.string     :name
      t.references :user,  index: true
      t.datetime   :destroyed_at, index: true

      t.timestamps
    end
  end
end
