class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string     :name
      t.tsvector   :search_vector, index: true, using: :gin
      t.datetime   :destroyed_at, index: true

      t.timestamps
    end
  end
end
