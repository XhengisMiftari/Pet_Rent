class Pet < ApplicationRecord
  belongs_to :user
end

class Pet < ApplicationRecord
  validates :image_url, presence: true
end
