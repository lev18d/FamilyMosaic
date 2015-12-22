class Profile < ActiveRecord::Base
	extend FriendlyId
	# make the saved data in smallcase
	before_save {
		first_name.downcase!
		if last_name
			last_name.downcase!
		end
		if hometown
			hometown.downcase!
		end
	}
	friendly_id :first_name, use: :slugged
	belongs_to :user
	has_one :tree
	has_attached_file :image, :styles => { :thumb => '100x100#', :medium => '200x200>', :large => '400x400>' }
	has_many :invites
	validates_attachment 	:image, 
				:content_type => { :content_type => /\Aimage\/.*\Z/ },

				:size => { :less_than => 20.megabyte }
	def self.last_id
		all.maximum("family_id")
	end

	# Search query in first_name, last_name and hometown attributes
	def self.search(query)
		where("first_name LIKE ? OR last_name LIKE ? OR hometown LIKE ?", 
			"#{query}", "#{query}", "#{query}")
	end
	
	def should_generate_new_friendly_id?
    first_name_changed?
  end
end
