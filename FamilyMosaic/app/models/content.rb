class Content < ActiveRecord::Base
  belongs_to :post

  has_attached_file :file

  validates_attachment :file, :presence => true,
		:content_type => { :content_type => 
			["image/jpeg", "image/gif", "image/png", "video/mp4", 
				"video/avi", "video/mpeg", "video/x-ms-wmv", 
				"video/x-flv"] },
			:size => { :in => 0..10.megabytes }


	# Extracting image dimensions
	before_save :extract_dimensions
	serialize :dimensions

	# Helper method to determine whether or not an attachment is an image.
	# @note Use only if you have a generic asset-type model that can handle different file types.
	def image?
  	file_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
	end

	private

	# Retrieves dimensions for image assets
	# @note Do this after resize operations to account for auto-orientation.
	def extract_dimensions
	  return unless image?
	  tempfile = file.queued_for_write[:original]
	  unless tempfile.nil?
	    geometry = Paperclip::Geometry.from_file(tempfile)
	    self.dimensions = [geometry.width.to_i, geometry.height.to_i]
	  end
	end


end
