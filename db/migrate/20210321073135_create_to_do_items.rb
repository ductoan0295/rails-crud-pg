class CreateToDoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :to_do_items do |t|
      t.string :itemDescription
      t.integer :priorityNumber
      t.belongs_to :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
