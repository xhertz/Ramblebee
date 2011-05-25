class Tour < ActiveRecord::Base
  
  belongs_to :users
  has_many :point_tours
  has_many :points, :through => :point_tours, :order => 'position'

  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  accepts_nested_attributes_for :points, :allow_destroy => true
  
end


