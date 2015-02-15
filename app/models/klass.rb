class Klass < ActiveRecord::Base
  has_many :classbooks
  has_many :users, through: :classbooks

  serialize :admin, Array
end
