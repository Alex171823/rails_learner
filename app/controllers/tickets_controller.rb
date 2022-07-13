class TicketsController < ApplicationController
  before_action :authenticate_user!, exclude: %i[new]
  before_action :new_ticket, only: %i[new]
  before_action :set_train, only: %i[new create edit]
  before_action :set_ticket, only: %i[show destroy edit update]
  before_action :check_user, only:  %i[show destroy edit update]


  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Wagon was successfully updated.' }
      else
        format.html { redirect_to tickets_path, notice: 'Ticket wasn\'t changed' }
      end
    end
  end

  def create
    stations = @train.route.railway_stations.ordered_by_index
    params_to_create = ticket_params.merge({ start_station: stations.first, end_station: stations.last,
                                             train_id: @train.id, user_id: current_user.id })
    @ticket = Ticket.new(params_to_create)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def new_ticket
    @ticket = Ticket.new
  end

  def check_user
    redirect_to root_path, alert: 'You can\'t edit this ticket' unless current_user == @ticket.user
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :passport, :train_id)
  end
end
