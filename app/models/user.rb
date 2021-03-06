class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :confirmable, :omniauthable, omniauth_providers: %i(google_oauth2)

  enum gender: %i(male female)

  validates_length_of :name,
    maximum: Settings.model.user.max_name_length,
    minimum: Settings.model.user.min_name_length
  validates_presence_of :gender
  validates_presence_of :dob
  validates_presence_of :code
  validates_numericality_of :phone
end
