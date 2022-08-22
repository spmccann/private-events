class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to event_url(@event), notice: 'Event was succesfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find([:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date, :location)
  end
end
