module ProfilesHelper
	def add_family_id
		if current_user.profile.family_id.nil?
			last_family_id = Profile.last_id
			if last_family_id.nil?
			  new_family_id = 1
			else
				new_family_id = last_family_id + 1
			end
			return new_family_id
		else
			return -1
		end
	end
end
