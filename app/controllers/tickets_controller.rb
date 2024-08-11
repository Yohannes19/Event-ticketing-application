class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def new
    @ticket = @event.tickets.build
  end

  def create
    @ticket = @event.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to @event, notice: 'Ticket successfully purchased!'
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def ticket_params
    params.require(:ticket).permit(:seat_number, :price)
  end
end
