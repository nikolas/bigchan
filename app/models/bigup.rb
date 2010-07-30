# == Schema Information
# Schema version: 20100728231344
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
#

class Bigup < ActiveRecord::Base
  attr_accessible :name, :title, :content, :pic

  has_attached_file :pic,
      :styles => { :large => "640x480>", :thumb => "100x100>" },
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :path => "/:style/:filename"

  validates_attachment_presence :pic, :message => 'image is required'
  validates_attachment_size :pic, :less_than => 5.megabytes,
      :message => 'image must be smaller than 5 megabytes'
  validates_attachment_content_type :pic, :content_type => ['image/jpg',
      'image/jpeg', 'image/png', 'image/gif', 'image/bmp'],
      :message => 'image must be a jpg, png, gif, or bmp'

  # pagination
  cattr_reader :per_page
  @@per_page = 12
  default_scope :order => 'created_at DESC'
end
