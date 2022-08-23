class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @events = Event.where('creator_id = ?', @user)
    @attending = AttendedEvent.where('attendee_id = ?', @user)
  end
end
