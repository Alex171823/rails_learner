class AddPassportToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :passport, :string
  end
end
