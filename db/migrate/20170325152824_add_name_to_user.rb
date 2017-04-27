class AddNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    User.create! do |u|
        u.email     = 'test@test.com'
        u.name      = 'Test'
        u.password    = 'password'
        u.supervisor_role = true
        u.superadmin_role = true
    end
  end
end
