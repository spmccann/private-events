class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: %i[ show destroy attend ]

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
    @attended_event = AttendedEvent.where('event_id = ?', @event)
  end

  def attend
    AttendedEvent.create(attendee_id: current_user.id, event_id: @event.id)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: 'Event was successfuly destroyed'
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date, :location, :creator_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
