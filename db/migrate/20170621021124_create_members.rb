class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :gender
      t.date :dob

      t.timestamps
    end
  end
end
