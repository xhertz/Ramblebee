class Point < ActiveRecord::Base
  # make sure this before_save filter is before the include RankedModel as including RankedModel introduces
  # a before_filter that needs to run after set_position
#  before_save :set_position, :if => Proc.new { |point| point.completed_changed? || point.new_record? }
#  include RankedModel
  acts_as_gmappable

  has_many :tours, :through => :point_tours
  validates :name, :presence => true
  
  scope :completed, where(:completed => true).order('updated_at desc')
  scope :active, where(:completed => false).order('position')
 
  

  def gmaps4rails_address
        #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
        "#{self.latitude}"
  end
 
  def gmaps4rails_sidebar
  "<span>#{name} </span>"
  end
  
  def gmaps4rails_infowindow
        # add here whatever html content you desire, it will be displayed when users clicks on the marker
        "#{self.name}"
  end
  
 # ranks :position, :with_same => :tour_id

  # if a point record is new, move it to the bottom of the list
  # if a point is moving from completed to active, move it to the bottom of the list
  # if a point is moving from active to completed, movie it to the top of the list
  def set_position
    self.position_position = (new_record? || completed_was) ? :last : :first 
  end
  
end
