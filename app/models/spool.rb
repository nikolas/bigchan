class Spool < ActiveRecord::Base
  has_many :bigups, :dependent => :destroy
  accepts_nested_attributes_for :bigups

  # pagination
  cattr_reader :per_page
  @@per_page = 8
  default_scope :order => 'created_at DESC'
end
