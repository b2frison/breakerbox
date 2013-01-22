class Breaker < ActiveRecord::Base
  attr_accessible :address, :bboying_since, :birthday, :country, :email, :favorite_character, :name, :password, :province, :region, :breaking_name, :city, :state, :photo
  acts_as_gmappable
  has_attached_file :photo, :styles => { :small => "150x150>" }

  def gmaps4rails_address
	  "#{address}, #{city}, #{state}, #{country}"
  end

  def gmaps4rails_infowindow
	"<h4>#{address}<br />#{city}<br/?{state}<br/>#{country}</h4>"
  end
  

 
end
