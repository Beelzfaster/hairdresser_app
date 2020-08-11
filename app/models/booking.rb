class Booking < ApplicationRecord
  belongs_to :user
  has_many :appointments
  def self.search_by(search_term)
    where("colour LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
