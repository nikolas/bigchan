class Spool < ActiveRecord::Base
  has_many :bigups, :dependent => :destroy
  accepts_nested_attributes_for :bigups

  # pagination
  default_scope :order => 'updated_at DESC'
end
