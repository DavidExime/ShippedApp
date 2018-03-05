class Job < ApplicationRecord
<<<<<<< HEAD
  has_and_belongs_to_many :boats
validates :origin, :presence => true
validates :destination, :presence => true



=======
  has_many :works
  has_many :boats, :through => :works
>>>>>>> master
end


# sets rules for the user 
