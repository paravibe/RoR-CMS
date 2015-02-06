class Profile < ActiveRecord::Base
  serialize :social, Hash
  belongs_to :user
  validates :user_id, :presence => true
end
