class Classbook < ActiveRecord::Base
  belongs_to :user
  belongs_to :klass

  def self.find_or_link class_id, user, admin
    # valid check
    return false if user.id.nil?
    c = Klass.find(class_id)
    if c.admin.include? admin.id
      link = self.where(klass_id: class_id, user_id: user.id).first
      if link.nil?
        self.create(
          klass_id: class_id,
          user_id: user.id
        )
      end
      return true
    else
      return false
    end
  end
end
