class Pet < ApplicationRecord
  belongs_to :user
  has_one :reservation
  has_one_attached :photo

  def reserved?
  reservation.present?
  end

end
