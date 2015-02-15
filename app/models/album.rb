class Album < ActiveRecord::Base
  belongs_to :klass
  has_many :pictures

  def self.pick klass, id
    album = self.where(id: id).first
    if album.nil?
      album = klass.unchecked_albums.last
    end
  end

  def picture
    pictures.last
  end
end
