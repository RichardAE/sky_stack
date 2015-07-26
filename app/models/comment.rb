class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates_length_of :text, allow_blank: false
end
