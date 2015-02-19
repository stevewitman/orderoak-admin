class Item < ActiveRecord::Base
  mount_uploader :photo, ItemPhotoUploader
end
