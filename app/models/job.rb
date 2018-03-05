class Job < ApplicationRecord
  has_many :works
  has_many :boats, :through => :works
end
