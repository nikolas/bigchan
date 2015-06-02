class Bigup < ActiveRecord::Base
  belongs_to :spool

  attr_accessible :name, :title, :content, :pic
  acts_as_textiled :content

  has_attached_file :pic,
                    :styles => { :large => "640x480>" },
                    :storage => :s3,
                    :s3_protocol => 'https',
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    },
                    :bucket => ENV['S3_BUCKET'],
                    :path => "/:style/:filename"

  validate :validates_photo_or_post
  validates_attachment_content_type :pic,
                                    :content_type => [
                                      'image/jpeg',
                                      'image/png',
                                      'image/gif',
                                      'image/pjpeg',
                                      'image/tiff',
                                      'image/x-png',
                                      'image/bmp',
                                      'image/svg+xml'
                                    ],
                                    :if => Proc.new { |p| p.errors.blank? }

  # totally yoinked from forttree
  validates_attachment_size :pic,
                            :less_than => 5.megabytes,
                            :message => "File too big! :{",
                            :if => Proc.new { |p| p.errors.blank? }

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

    s = str.encode('UTF-8')
    s.downcase!
    s.gsub!(/'/, '')
    s.gsub!(/[^A-Za-z0-9]+/, ' ')
    s.strip!
    s.gsub!(/\ +/, '-')

    return s
  end

  def validates_photo_or_post
    if content.blank? && pic_file_name.blank?
      errors[:base] << "You must have text or a picture, why would you want to make a blank post? ;3"
    end
  end
end
