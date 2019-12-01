class User < ApplicationRecord
  has_many :notes
  has_many :groups
  has_many :messages
  has_many :tutor_ads
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
  	# try to find existing user by provider and uid
  	# 	otherwise, create
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end
end
