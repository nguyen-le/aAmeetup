class EventsController < ApplicationController
  before_action :can_create?, only: [:new, :show]
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
#    @event = Event.new(event_params)

    if @event.save
      redirect_to event_url(@event)
    else
      flash.now[:notices] = @event.errors.full_messages
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to event_url(@event)
    else
      flash.now[:notices] = @event.errors.full_messages
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :time, :description)
  end

  def can_create?
    unless logged_in?
      flash[:notices] = ["Must be logged in first!"]
      redirect_to new_session_url
    end
  end
end
