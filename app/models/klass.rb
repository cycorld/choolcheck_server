class Klass < ActiveRecord::Base
  has_many :classbooks
  has_many :users, through: :classbooks
  has_many :albums
  has_many :pictures, through: :albums

  serialize :admin, Array

  def unchecked_albums user_id
    Album.where(klass_id: self.id).unchecked_albums user_id
  end

  def days
    return [1, 2]
  end
end
