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

end
