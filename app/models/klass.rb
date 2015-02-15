class Klass < ActiveRecord::Base
  has_many :classbooks
  has_many :users, through: :classbooks
  has_many :albums

  serialize :admin, Array

  def unchecked_albums
    self.albums
  end
end
