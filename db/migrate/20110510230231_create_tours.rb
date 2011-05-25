class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.string :name
      t.string :localeName
      t.string :shortDescription
      t.text :longDescription
      t.string :tag
      t.string :language
      t.string :category
      t.string :type
      t.integer :distances
      t.string :ageGroup
      t.integer :timeRequired
      t.string :city
      t.string :country
      t.string :bestTime
      t.float :price
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tours
  end
end
