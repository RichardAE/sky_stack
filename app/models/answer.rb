class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, dependent: :destroy, as: :commentable

  validates_length_of :text, minimum: 5, allow_blank: false
end
