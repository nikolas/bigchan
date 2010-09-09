# == Schema Information
# Schema version: 20100801002255
#
# Table name: spools
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Spool < ActiveRecord::Base
  has_many :bigups, :dependent => :destroy
  accepts_nested_attributes_for :bigups

  # pagination
  cattr_reader :per_page
  @@per_page = 5
  default_scope :order => 'updated_at DESC'
end
