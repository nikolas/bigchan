module ApplicationHelper
  def title
    base_title = 'bigchan'
    if @title.nil?
      base_title
    else
      "#{base_title} ~ #{h(@title)}"
    end
  end

  def facebook_like(like_path)
    content_tag :iframe,
        nil,
        :src => "http://www.facebook.com/plugins/like.php?href=#{like_path}&layout=standard&show_faces=false&width=450&action=like&font=verdana&colorscheme=light&height=35",
        :scrolling => 'no',
        :frameborder => '0',
        :style => "border:none; overflow:hidden",
        :width => "450px",
        :height => "35px",
        :allowtransparency => true
  end

  def facebook_little_like(like_path)
    content_tag :iframe,
        nil,
        :src => "http://www.facebook.com/plugins/like.php?href=#{like_path}&layout=button_count&show_faces=false&width=450&action=like&font=verdana&colorscheme=light&height=35",
        :scrolling => 'no',
        :frameborder => '0',
        :style => "border:none; overflow:hidden",
        :width => "450px",
        :height => "35px",
        :allowtransparency => true
  end

	def random_color
		colors = ['orange', 'blue', 'green', 'pink']
		return colors[rand(colors.size)]
	end

end
