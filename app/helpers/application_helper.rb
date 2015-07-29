module ApplicationHelper
  def owner?(object:)
    object.user == current_user
  end

  def get_container_class
    if hide_sidebar?
      'col-md-12'
    else
      'col-md-9'
    end
  end

  def hide_sidebar?
    @hide_sidebar ||= %w{sessions registrations}.include?(controller_name) && %w{new create}.include?(action_name)
  end

  # TODO this should be refactored to store counts somewhere sensible, ie the database or perhaps session
  def get_content_count(type:)
    @content_counts ||= {
      'questions' => Question.count,
      'answers'  => Answer.count
    }

    @content_counts[type]
  end

  def bootstrap_class_for(flash_type: )
    case flash_type.to_s
      when 'alert'
        flash_type = 'danger'
      when 'notice'
        flash_type = 'success'
    end

    "alert alert-#{flash_type.to_s}"
  end

  # TODO this will get messy if we add any more menu items
  def check_active_page(page:)
    new_question? && page == 'new_question' || !new_question? && page == 'questions' ? 'current_page_item' : ''
  end

  def new_question?
    controller_name == 'questions' && action_name == 'new'
  end
end
