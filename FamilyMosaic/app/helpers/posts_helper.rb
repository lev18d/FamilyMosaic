module PostsHelper
	def generateChapter post
		chapter = Chapter.new
		random = Random.new
		color = "rgba(" + random.rand(255).to_s() + "," + random.rand(255).to_s() + "," + random.rand(255).to_s() + ",0.1)"
		chapter.color = color
		year = Time.new(post.date.to_s).year.to_int
		decade = year - (year%10)
		chapter.start_date = decade.to_s + "-01-01"
		chapter.end_date = (decade + 10).to_s + "-01-01"
		return chapter
	end
end