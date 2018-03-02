class Boat < ApplicationRecord
  validates :capacity, numericality: {greater_than: 0}
  validates :capacity, numericality: {only_integer: true}
  has_and_belongs_to_many :jobs
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
