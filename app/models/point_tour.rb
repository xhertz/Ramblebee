class PointTour < ActiveRecord::Base
  
  belongs_to :tour
  belongs_to :point
  
end
