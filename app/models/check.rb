class Check < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture

  def self.checked_picture_ids user_id
    where(user_id: user_id).map(&:user_id).uniq
  end

  def self.unchecked_picture_ids user_id
    User.find(user_id)
      .pictures.map(&:id)
      .reject{|pid|
        self.checked_picture_ids(user_id).include? pid
      }
  end
end
