class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

      if @location.save
        redirect_to @location, notice: "Location was successfully created."
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: "Location was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
      redirect_to locations_url, notice: "Task was successfully destroyed."
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :zipcode)
  end

  def set_location
    @location = Location.find(params[:id])
  end




end
