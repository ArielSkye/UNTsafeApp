class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100"}

	geocoded_by :longitude
    after_validation :geocode

end
