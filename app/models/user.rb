class User < ActiveRecord::Base
  has_many :classbooks
  has_many :klasses, through: :classbooks
  has_many :albums, through: :klasses
  has_many :pictures, through: :albums
  has_many :checks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create params
    user = self.find_by(email: params[:email])
    if user.nil?
      user = self.create(
        email: params[:email],
        name: params[:name],
        dept: params[:dept],
        code: params[:code],
        password: "test1234",
        password_confirmation: "test1234"
      )
      # TODO : send email to new_user
    end
    return user
  end
end
