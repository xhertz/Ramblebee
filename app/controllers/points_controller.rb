class PointsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_tour, :except => :toggle_completed
  
  def new
    @point = @tour.points.new
  end
  
  def create
    @point = @tour.points.new(params[:point])
    if @point.save
      respond_to do |format|
        format.html {redirect_to @tour, :notice => 'point successfully created'}
        format.js
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.js { render :json => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  #  this update action is used only via ajax when sorting point
  def update
    @point = @tour.point.find(params[:id])
    if @point.update_attributes(params[:point])
      flash.now[:notice] = 'point successfully updated'
      render :nothing => true
    else
      render :json => @point.errors, :status => :unprocessable_entity
    end
  end
 
  def toggle_completed
    @point = point.find(params[:id])
    @tour = @point.tour
    
    if @tour.user != current_user
      raise ActiveRecord::RecordNotFound
    else
      @point.toggle!(:completed)
    end
  end
  
  private
  
  def find_tour
    @tour = current_user.tours.find(params[:tour_id])
  end
  
  
end
