class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :reactions

  attr_accessor :name, :email, :password, :password_confirmation, :remember_me
end
