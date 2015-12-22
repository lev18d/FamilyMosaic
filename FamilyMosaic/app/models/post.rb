class Post < ActiveRecord::Base
	has_many :contents, :dependent => :destroy
	belongs_to :chapter
	validates :date, presence: true
	#validates :contents, 
		#presence: {message: "Either pictures/videos or story need to be present."}
		#,unless: :story.present?
	#validates :story, 
	#	presence: {message: "Either pictures/videos or story need to be present."},
	#	unless: :contents
end

