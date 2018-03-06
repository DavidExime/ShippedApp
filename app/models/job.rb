class Job < ApplicationRecord
validates :description, length: { minimum: 20 }
validates :totalcontainers, numericality: { only_integer: true }
validates :totalcontainers, numericality: { greater_than: 0 }
has_many :works
has_many :boats, :through => :works
end
