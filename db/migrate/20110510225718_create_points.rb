class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.string :name
      t.string :localeName
      t.string :shortDescription
      t.text :longDescription
      t.string :tag
      t.string :language
      t.string :category
      t.integer :timeRequiredForResource
      t.integer :timeSuggestedToSpend
      t.string :bestTime
      t.float :latitude
      t.float :longitude
      t.float :altitude

      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end
