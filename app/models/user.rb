class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  letsrate_rater
  

  has_many :questions
  has_many :likes

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.username = auth.info.nickname
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
  	end
  end

  def password_required?
  	super && provider.blank?
  end

  def update_with_password(params, *options)
  	if encrypted_password.blank?
  		update_attributes(params, *options)
  	else
  		super
  	end
  end



end
