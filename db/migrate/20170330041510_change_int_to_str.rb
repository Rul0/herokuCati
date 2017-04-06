class ChangeIntToStr < ActiveRecord::Migration[5.0]
  def up
    change_column :respondents, :phone, :string
  end

  def down
    change_column :respondents, :phone, :int
  end

end
