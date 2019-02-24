class RemoveRoleFormUsers < ActiveRecord::Migration[5.2]
  def change
	remove_column :users, :role, :text
  end
end
