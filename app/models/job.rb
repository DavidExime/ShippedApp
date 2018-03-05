class Job < ApplicationRecord
  has_and_belongs_to_many :boats
validates :origin, :presence => true
validates :destination, :presence => true



end


# sets rules for the user 
