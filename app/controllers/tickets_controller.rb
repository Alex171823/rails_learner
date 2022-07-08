class TicketsController < ApplicationController
  before_action :new_ticket, only: %i[new]
  before_action :set_train, only: %i[new show]
  before_action :set_ticket, only: %i[show destroy]

  def create
    train = Train.find(params[:train_id])
    stations = train.route.railway_stations.ordered_by_index
    start_station = stations.first
    end_station = stations.last
    params_to_create = ticket_params
    params_to_create[:start_station] = start_station
    params_to_create[:end_station] = end_station
    params_to_create[:train_id] = train.id
    @ticket = Ticket.new(params_to_create)
    if @ticket.save
      redirect_to train_ticket_path(train, @ticket)
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to new_search_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def new_ticket
    @ticket = Ticket.new
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:name, :passport, :user_id, :train_id)
  end
end
