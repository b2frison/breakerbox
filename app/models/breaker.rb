class Breaker < ActiveRecord::Base
  attr_accessible :address, :bboying_since, :birthday, :country, :email, :favorite_character, :name, :password, :province, :region, :breaking_name, :city, :state, :photo
  acts_as_gmappable
  after_save :store_photo

  def gmaps4rails_address
	  "#{address}, #{city}, #{state}, #{country}"
  end

  def gmaps4rails_infowindow
	"<h4>#{address}<br />#{city}<br/?{state}<br/>#{country}</h4>"
  end
  
  def photo=(file_data)
	  unless file_data.blank?
		  @file_data = file_data
		  self.extension = file_data.original_filename.split('.').last.downcase
	  end
  end

  PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'

  def photo_filename
	  File.join PHOTO_STORE, "#{id}.#{extension}"
  end

  def photo_path
	  "/photo_store/#{id}.#{extension}"
  end

  def has_photo?
	  File.exists? photo_filename
  end


private
  def store_photo
    if @file_data
	    FileUtils.mkdir_p PHOTO_STORE
	    File.open(photo_filename, 'wb') do |f|
		    f.write(@file_data.read)
	    end
	    @file_data = nil
    end
  end

 
end
