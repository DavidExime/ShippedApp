class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :boats, :dependent => :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
