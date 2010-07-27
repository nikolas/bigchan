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
  attr_accessible :name, :title, :content
end
