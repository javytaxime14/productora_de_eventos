class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :members_number
      t.date :debut
      t.integer :group_class, default: 0

      t.timestamps
    end
  end
end
