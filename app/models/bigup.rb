# == Schema Information
# Schema version: 20100727013913
#
# Table name: bigups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Bigup < ActiveRecord::Base
  attr_accessible :name, :title, :content, :pic

  has_attached_file :pic,
      :styles => { :large => "640x480>", :thumb => "100x100>" },
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :path => "/:style/:filename"

  validates_attachment_presence :pic
  validates_attachment_size :pic, :less_than => 5.megabytes
  validates_attachment_content_type :pic, :content_type => ['image/jpg',
      'image/png', 'image/gif', 'image/bmp']
end
