class Relationship < ActiveRecord::Base
	belongs_to :tree
	def add_relationship(r_type)
		if Relationship.where(type: "#{r_type}").nil?
			new_r = Relationship.new(:type => r_type) 
			if new_r.save?
				return 1
			else
        return -1
			end
		end
		return 1
	end
end
