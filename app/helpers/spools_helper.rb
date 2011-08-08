module SpoolsHelper
	def random_color
		colors = ['orange', 'blue', 'green', 'pink']
		return colors[rand(colors.size)]
	end
end
