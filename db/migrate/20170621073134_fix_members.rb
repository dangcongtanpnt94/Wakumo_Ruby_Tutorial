class FixMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :email, :string
    add_column :members, :role, :string
    change_column :members, :gender, :string
  end
end
