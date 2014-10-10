class EventsController < ApplicationController
  before_action :must_be_logged_in, except: :index
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

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
    @recent_events   = Event.where("events.date < ?", Time.now)
    @upcoming_events = Event.where("events.date > ?", Time.now)
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

end
