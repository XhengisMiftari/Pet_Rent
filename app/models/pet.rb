class Pet < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_one :reservation
  has_one_attached :photo

  def reserved?
  reservation.present?
  end

  def my_pets
  @pets = current_user.pets
  end

end
