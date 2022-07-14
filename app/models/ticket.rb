class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :user

  after_create :buy_email_notification
  after_destroy :delete_email_notification

  validates :name, :passport, :user_id, presence: true

  private

  def buy_email_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def delete_email_notification
    TicketsMailer.delete_ticket(user, self).deliver_now
  end
end
