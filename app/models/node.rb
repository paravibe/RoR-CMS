class Node < ActiveRecord::Base
  belongs_to :user
  has_one :node_title

  validates :status, :presence => true
  validates :user_id, :presence => true

  scope :sorted, lambda { order("id DESC") }
end
