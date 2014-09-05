class RsvpsController < ApplicationController
  def create
    @rsvp = current_user.rsvps.new(event_id: params[:event_id])
    @rsvp.save
    redirect_to event_url(@rsvp.event)
    flash[:notices] = ["Thanks for RSVPing!"]
  end

  def index
    @event = Event.find(params[:event_id])
  end
end
