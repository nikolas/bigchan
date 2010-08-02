class Bigup < ActiveRecord::Base
  attr_accessible :name, :title, :content, :pic

  has_attached_file :pic,
      :styles => { :large => "640x480>" },
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      },
      :bucket => ENV['S3_BUCKET'],
      :path => "/:style/:filename"

  #validates_attachment_presence :pic, :message => 'image is required',
  #    :on => :index
  #validates_attachment_size :pic, :less_than => 5.megabytes,
  #    :message => 'image must be smaller than 5 megabytes'
  #validates_attachment_content_type :pic, :content_type => ['image/jpg',
  #    'image/jpeg', 'image/png', 'image/gif', 'image/bmp'],
  #    :message => 'image must be a jpg, png, gif, or bmp'

  belongs_to :spool, :touch => true
end
