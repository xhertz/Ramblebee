class AddGmapsToPoints < ActiveRecord::Migration
  def self.up
    add_column :points, :gmaps, :boolean
  end

  def self.down
    remove_column :points
  end
end
