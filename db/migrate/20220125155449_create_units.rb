class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units, comment: "International System of Units" do |t|
      t.string :name, comment: "Symbol of Units (kg, m, etc)"
      t.datetime :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
