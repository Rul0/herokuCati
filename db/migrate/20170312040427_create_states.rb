class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.references :respondent, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :state, default: 0
      t.text :note

      t.timestamps
    end
  end
end
