class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates :name, :presence => true,
            :length => { :maximum => 25 }

  scope :sorted, lambda { order("id ASC") }

end
