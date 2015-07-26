class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :questions
  has_many :answers
  has_many :comments
end
