module ApplicationHelper

  def my_name
    'gianpietro1'
  end

  def form_group_class(errors)
    if errors.any?
      "form-group has-error"
    else
      "form-group"
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def up_vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).up_vote?
      "glyphicon glyphicon-chevron-up voted"
    else
      "glyphicon glyphicon-chevron-up"
    end
  end

  def down_vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).down_vote?
      "glyphicon glyphicon-chevron-down voted"
    else
      "glyphicon glyphicon-chevron-down"
    end
  end

end
