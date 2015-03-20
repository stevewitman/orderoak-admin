class Menuitem < ActiveRecord::Base
  mount_uploader :photo, ItemPhotoUploader
  validates :menugroup, :name, :price, presence: true
  belongs_to :stores
end
