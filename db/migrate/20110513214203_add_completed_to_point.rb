class AddCompletedToPoint < ActiveRecord::Migration
  def self.up
    add_column :points, :completed, :boolean, :default => false
  end

  def self.down
    remove_column :points, :completed
  end
end
