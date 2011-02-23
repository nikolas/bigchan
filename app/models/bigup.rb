class Bigup < ActiveRecord::Base
  belongs_to :spool

  attr_accessible :name, :title, :content, :pic
  acts_as_textiled :content

  has_attached_file :pic,
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      },
      :bucket => ENV['S3_BUCKET'],
      :path => "/:style/:filename"

  before_post_process :transliterate_file_name

  private
    def transliterate_file_name
      extension = File.extname(pic_file_name).gsub(/^\.+/, '')
      filename = pic_file_name.gsub(/\.#{extension}$/, '')

      # Prepend timestamp for a unique filename
      time = Time.now.strftime("%d-%m-%Y_%H-%M-%S_").to_s

      self.pic.instance_write(:file_name, "#{time}#{transliterate(filename)}.#{transliterate(extension)}")
    end 

    def transliterate(str)
      # Based on permalink_fu by Rick Olsen

      s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s
      s.downcase!
      s.gsub!(/'/, '')
      s.gsub!(/[^A-Za-z0-9]+/, ' ')
      s.strip!
      s.gsub!(/\ +/, '-')

      return s
    end

end
