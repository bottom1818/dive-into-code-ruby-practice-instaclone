class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable,
         :validatable, :omniauthable, omniauth_providers: %i(google facebook)
         
  has_many :instaclone_contents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_instaclone_contents, through: :favorites, source: :instaclone_content
  
  mount_uploader :image_url, ImageUploader
  
  def self.create_unique_string
    SecureRandom.uuid
  end
  
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(email: auth.info.email,
        provider: auth.provider,
        uid: auth.uid,
        password: Devise.friendly_token[0, 20],
        )
    end
    user.save
    user
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(provider: auth.provider,
        uid: auth.uid,
        email: "#{auth.uid}-#{auth.provider}@example.com",
        password: Devise.friendly_token[0, 20]
        )
    end
    user.save
    user
  end

end
