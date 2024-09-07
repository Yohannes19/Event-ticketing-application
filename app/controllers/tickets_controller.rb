class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event


  def index
    @tickets = @event.tickets
  end

  def show
    @tickets
  end

  def new
    @ticket = @event.tickets.build
  end

  def create
    @ticket = @event.tickets.build(ticket_params.merge(user: current_user))
    
    if @ticket.save
      redirect_to @event, notice: 'Ticket successfully purchased!'
    else
      redirect_to @event, alert: @ticket.errors.full_messages.join(", ")
    end
  end

  

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    @ticket.destroy
    redirect_to @event, notice: 'Ticket was successfully canceled.'
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def ticket_params
    params.require(:ticket).permit(:seat_number, :price)
  end
end
