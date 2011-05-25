class ToursController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tours = current_user.tours
  end
  
  def show
    @tour = current_user.tours.find(params[:id])
    @points = Point.all.each
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