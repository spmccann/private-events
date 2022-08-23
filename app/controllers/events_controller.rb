class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    @event = Event.find(params[:id])
    @attended_event = AttendedEvent.where('event_id = ?', @event)
  end

  def attend
    @event = Event.all.find(params[:id])
    AttendedEvent.create(attendee_id: current_user.id, event_id: @event.id)
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date, :location, :creator_id)
  end
end
