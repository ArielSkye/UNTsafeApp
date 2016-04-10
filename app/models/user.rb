class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :pins
   
   validates :contactname, presence: true
   validates :contactnumber, presence: true
   validates :contactnumber, :phone_number => {:ten_digits => true, :message => "Invalid phone number. Please enter a 10-digit number."}

   geocoded_by :longitude
   after_validation :geocode
   
end
