class Album < ActiveRecord::Base
  belongs_to :klass
  has_many :pictures

  def self.pick klass, album_id, user_id
    album = self.where(id: album_id).first
    if album.nil?
      album = self.unchecked_albums(user_id).last
    end
    album
  end

  def self.checked_albums user_id
    albums = Array.new
    Check.checked_picture_ids(user_id).each do |pid|
      albums << Picture.find(pid).album
    end
    albums
  end

  def self.unchecked_albums user_id
    albums = Array.new
    Check.unchecked_picture_ids(user_id).each do |pid|
      albums << Picture.find(pid).album
    end
    albums
  end
end
