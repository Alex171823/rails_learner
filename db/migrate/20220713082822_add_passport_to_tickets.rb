class AddPassportToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :passport, :string
  end
end
