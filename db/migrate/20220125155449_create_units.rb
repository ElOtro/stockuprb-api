class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name
      t.datetime :destroyed_at, index: true

      t.timestamps
    end
  end
end
