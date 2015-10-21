class User < ActiveRecord::Base

  acts_as_commontator

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:cas]

  # Omniauth
  attr_accessible :provider, :uid, :name, :email, :encrypted_password
end
