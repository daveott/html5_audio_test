# stolen from http://ramblingsonrails.com/how-to-make-a-custom-form-builder-in-rails
# removed additional complexity that only allowed use on slightly more complex
# forms
class FormBuilder < ActionView::Helpers::FormBuilder
  def label(method, text = nil, options = {})
    if text.kind_of?(Hash)
      options.merge!(text)
      text = nil
    end
    text = text || method.to_s.humanize
    unless object.nil? || options[:hide_errors]
      errors = object.errors[method.to_sym]
      if errors
        text += " <span class=\"error\">#{errors.is_a?(Array) ? errors.first : errors}</span>"
      end
    end
    text += " #{options[:additional_text]}" if options[:additional_text]
    super(method, text.html_safe, options)
  end

  def block_label(method, &block)
    body = @template.capture(&block)
    label(method, body)
  end
end
