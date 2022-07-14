class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :user

  validates :name, :passport, :user_id, presence: true

  after_create :send_email_on_buy
  after_destroy :send_email_on_delete

  private

  def send_email_on_buy
    TicketsMailer.buy_ticket(self.user, self ).deliver_now
  end

  def send_email_on_delete
    TicketsMailer.delete_ticket(self.user, self ).deliver_now
  end
end
