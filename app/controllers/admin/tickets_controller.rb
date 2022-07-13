class Admin::TicketsController < Admin::BaseAdminController
  before_action :set_ticket, only: %i[show destroy edit update]

  def index
    @tickets = Ticket.all
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to [:admin, @ticket], notice: 'Wagon was successfully updated.' }
      else
        p @ticket.errors
        format.html { redirect_to admin_tickets_path, notice: 'Ticket wasn\'t changed' }
      end
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :passport, :train_id)
  end
end
