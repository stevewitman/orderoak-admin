class Menuitem < ActiveRecord::Base
  mount_uploader :photo, ItemPhotoUploader
  belongs_to :stores
end
