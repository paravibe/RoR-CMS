class Node < ActiveRecord::Base
  belongs_to :user
  has_one :node_title, dependent: :destroy
  accepts_nested_attributes_for :node_title, :allow_destroy => true
  mount_uploader :image, ImageUploader

  validates :user_id, :presence => true

  scope :sorted, lambda { order("id DESC") }
end
