class RemovePercentsFromStep < ActiveRecord::Migration
  def up
    remove_column :steps, :precents
  end

  def down
    add_column :steps, :precents, :integer
  end
end
