class Picture < ActiveRecord::Base
  belongs_to :album
  has_many :checks

  mount_uploader :picture, PictureUploader
end
