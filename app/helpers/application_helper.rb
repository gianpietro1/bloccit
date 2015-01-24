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

end
