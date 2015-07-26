module CommentsHelper
  def build_commentable_path(commentable:, parent:)
    parent.nil? ? [commentable, Comment.new] : [parent, commentable, Comment.new]
  end

  def build_commentable_id(commentable:, type:)
    id = "#{commentable.class.name.downcase}_#{commentable.id}_comments"
    id.concat("_#{type}") unless type.nil?
    id
  end
end
