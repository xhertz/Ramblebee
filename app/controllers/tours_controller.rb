class ToursController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tours = current_user.tours
  end
  
  def show
    @tour = current_user.tours.find(params[:id])
    @json = @tour.points.to_gmaps4rails  
    @locations = Gmaps4rails.geocode(@tour.name)
    @points = []
    @bounds = []
    @locations.each do |location|
         @point = Point.new(:name => location[:matched_address], :latitude => location[:lat], :longitude => location[:lng], :gmaps => true);
        # @bounds = [location[:bounds]["northeast"], location[:bounds]["southwest"]]
          @bounds =          '[{"lat": 53.7161, "lng": -113.273159 }, {"lat": 53.395655 , "lng": -113.714738 }]'
    
         @points.push(@point)
    end
    @starts = @points.to_gmaps4rails   
    
    
    
    
    if params[:sort_points]
      render :action => 'sort_points'
    end
  end
  

  def new
    @tour = current_user.tours.new
  end
  
  def create
    @tour = current_user.tours.new(params[:tour])
    if @tour.save
      redirect_to tour_path(@tour, :show_point_form => true)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @tour = current_user.tour.find(params[:id])
  end
  
  def update
    @tour = current_user.tour.find(params[:id])
    if @tour.update_attributes(params[:tour])
      redirect_to @tour
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @tour = current_user.tour.find(params[:id])
    if @tour.destroy
      flash[:notice] = "tour #{@tour.name} has been sent to the garbage can."
    end
    redirect_to tour_path
  end
  
end