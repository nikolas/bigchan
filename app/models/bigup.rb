# == Schema Information
# Schema version: 20100801002255
#
# Table name: bigups
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  title            :string(255)
#  content          :text
#  created_at       :datetime
#  updated_at       :datetime
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#  spool_id         :integer
#

class Bigup < ActiveRecord::Base
  attr_accessible :name, :title, :content, :pic
  acts_as_textiled :content

  has_attached_file :pic,
      :styles => { :large => "640x480>" },
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      },
      :bucket => ENV['S3_BUCKET'],
      :path => "/:style/:filename"

  before_post_process :transliterate_file_name

  belongs_to :spool, :touch => true

  private
    def transliterate_file_name
      extension = File.extname(pic_file_name).gsub(/^\.+/, '')
      filename = pic_file_name.gsub(/\.#{extension}$/, '')
      self.pic.instance_write(:file_name, "#{transliterate(filename)}.#{transliterate(extension)}")
    end 

    def transliterate(str)
      # Based on permalink_fu by Rick Olsen

      # Escape str by transliterating to UTF-8 with Iconv
      s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s
      # Downcase string
      s.downcase!
      # Remove apostrophes so isn't changes to isnt
      s.gsub!(/'/, '')
      # Replace any non-letter or non-number character with a space
      s.gsub!(/[^A-Za-z0-9]+/, ' ')
      # Remove spaces from beginning and end of string
      s.strip!
      # Replace groups of spaces with single hyphen
      s.gsub!(/\ +/, '-')

      return s
    end

end
