class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  #get user location by ip
	# geocoded_by :ip_address,
	#   :latitude => :lat, :longitude => :lon
	# after_validation :geocode

  # get address 
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  



end
