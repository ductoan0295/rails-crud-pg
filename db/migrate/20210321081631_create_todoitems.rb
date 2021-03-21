class CreateTodoitems < ActiveRecord::Migration[6.1]
  def change
    create_table :todoitems do |t|
      t.string :itemDescription
      t.integer :priorityNumber
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
