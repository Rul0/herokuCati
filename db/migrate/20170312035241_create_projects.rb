class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :company
      t.timestamp :start
      t.timestamp :finish
      t.integer :need
      t.string :url

      t.timestamps
    end
  end
end
