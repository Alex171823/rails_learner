class AddUserIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :tickets, :user, index: true
  end
end
