class Classbook < ActiveRecord::Base
  belongs_to :user

  def self.find_or_link class_id, user, admin
    # valid check
    return false if user.id.nil?
    c = Classes.find(class_id)
    if c.admin.include? admin.id
      link = self.where(class_id: class_id, user_id: user.id).first
      if link.nil?
        self.create(
          class_id: class_id,
          user_id: user.id
        )
      end
      return true
    else
      return false
    end
  end
end
