class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :completed_percents
      t.text :description

      t.timestamps
    end
  end
end
