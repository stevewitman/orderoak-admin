class Store < ActiveRecord::Base
  has_many :menuitems, dependent: :destroy
end
