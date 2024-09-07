class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  layout 'admin'

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path, notice: 'Event was successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location, :price)
  end

  def admin_only
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end
end
