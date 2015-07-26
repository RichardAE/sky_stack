class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers, dependent: :destroy
  has_many   :comments, dependent: :destroy, as: :commentable

  validates_length_of :title, minimum: 5, maximum: 255, allow_blank: false
  validates_length_of :text, minimum: 5, allow_blank: false
end
