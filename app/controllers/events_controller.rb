class EventsController < ApplicationController


  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]
    @location = Location.find(params[:location_id])

    if @event.save
      redirect_to location_event_path(@location, @event), notice: "Event was successfully created."
    else
      render event_path(@location)
    end
  end

  def show
    @location = Location.find(params[:location_id])
    @event = @location.events.find(params[:id])
  end

  def edit
    @location = Location.find(params[:location_id])
    @event = @location.events.find(params[:id])
  end

  def update
    @location = Location.find(params[:location_id])
    @event = @location.events.find(params[:id])

    if @event.save
      redirect_to location_path(@event.location_id), notice: "Event was successfully updated."
    else
      render location_path(@location)
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    @event = @location.events.find(params[:id])

    @event.destroy
      redirect_to location_path(@location), notice: "Event was successfully deleted."
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :require_id, :location_id)
  end
end
