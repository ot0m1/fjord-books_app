# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.password = Devise.friendly_token[0..5]
    end
  end
end
