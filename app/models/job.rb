class Job < ApplicationRecord
validates :origin, :presence => true
validates :destination, :presence => true
has_many :works
has_many :boats, :through => :works
end
