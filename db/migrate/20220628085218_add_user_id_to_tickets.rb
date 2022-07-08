class AddUserIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :tickets, :user
  end
end
