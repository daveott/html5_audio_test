# usage:
#  field_labeled('Select your address').should have_option("Home Address")
RSpec::Matchers.define :have_option do |expected|
  def options_for(select_field)
    select_field.all('option').map &:text
  end

  match do |select_field|
    select_field.has_selector?('option', :text => expected)
  end

  failure_message_for_should do |actual|
    "Expected this select field to have the following option: '#{expected}'. Actual options: #{options_for(actual).inspect}"
  end

  failure_message_for_should_not do |actual|
    "Expected the select field not to have the following option: '#{expected}'. It did!"
  end
end
