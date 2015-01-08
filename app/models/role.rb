class Role < ActiveRecord::Base

  validates :name, :presence => true,
            :length => { :maximum => 25 }

  scope :sorted, lambda { order("id ASC") }

end
