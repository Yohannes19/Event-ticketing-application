class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_organizer!, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @events
  end

  def new
    @event = current_user.organized_events.build
  end

  def create
    @event = current_user.organized_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created "
      else
        render "new"
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_organizer!
    redirect_to events_path, alert: 'Not authorized' unless @event.organizer == current_user
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end

end
