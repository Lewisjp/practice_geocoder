class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  #get user location by ip
	# geocoded_by :ip_address,
	#   :latitude => :lat, :longitude => :lon
	# after_validation :geocode

  # get address 
  #geocoded_by :address
  #after_validation :geocode, :if => :address_changed?

  #geocoded_by :ip_address
   # :latitude => :lat, :longitude => :lon
  #after_validation :geocode

  reverse_geocoded_by :lat, :lon do |obj, results|
  	if geo = results.first
  		obj.city = geo.city
  		obj.zipcode = geo.postal_code
  		obj.country = geo.country_code
  	end
  end
  after_validation :reverse_geocode
  



end
