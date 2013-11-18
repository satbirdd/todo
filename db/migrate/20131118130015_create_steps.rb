class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.integer :percents

      t.timestamps
    end
  end
end
