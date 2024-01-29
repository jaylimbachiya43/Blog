class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :friends
      t.string :first_name
      t.string :las_name
      t.string :email
      t.integer :phone
      t.string :instagram

      t.timestamps
    end
  end
end
