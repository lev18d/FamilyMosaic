class Story < ActiveRecord::Base
	:family_id
	:profile_id
	:name
	:story
	:date
	:creater_id
	:created_at
	:updated_at
	has_many :posts
	has_many :events
end
