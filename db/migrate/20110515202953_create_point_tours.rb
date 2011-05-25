class CreatePointTours < ActiveRecord::Migration
  def self.up
    create_table :point_tours do |t|
      t.integer :point_id
      t.integer :tour_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :point_tours
  end
end
