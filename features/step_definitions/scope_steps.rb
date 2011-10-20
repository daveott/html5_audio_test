module SectionLocator

  def within_class(class_name, text)
    within(:xpath, "//*[contains(concat(' ',normalize-space(@class),' '),' #{class_name} ')][contains(., '#{text}')]") do
      yield
    end
  end

  def with_id_or_class(name)
    name = name.downcase.gsub(/\s+/, '_')
    expr = "//*[@id='#{name}']|//*[contains(@class,'#{name}')]"
    expr if page.has_xpath? expr
  end

  def with_id(name)
    name = name.downcase.gsub(/\s+/, '_')
    expr = "//*[@id='#{name}']"
    return expr if page.has_xpath? expr
  end

  def with_section(content, elements = ['*'])
    "//*[(#{elements.join('|')})/descendant-or-self::*[contains(., '#{content}')]]"
  end

  def within_parent(content, elements = ['*'], &block)
    expr = with_id(content) || with_section(content, elements)
    within(:xpath, expr, &block)
  end

  def within_parent_preceding(content, elements = ['*'], &block)
    expr = %(//*[(#{elements.join('|')})[contains(., "#{content}")]]/..)
    within(:xpath, expr, &block)
  end

  def within_parent_element(content, element, &block)
    expr = %(//*[contains(text(), "#{content}")]/ancestor-or-self::#{element})
    within(:xpath, expr, &block)
  end

  def within_identifier(id_name, position = nil, &block)
    expr = with_id_or_class(id_name) || with_section(id_name)
    expr = "(#{expr})[#{position}]" if position
    within(:xpath, expr, &block)
  end
end

World(SectionLocator)

sections = %w(header footer hgroup nav h1 h2 h3 h4 h5 h6 legend caption dt strong p)

When /^(.*) in the "([^\"]*)" section$/ do |action, title|
  within_parent(title, sections) do
    When action
  end
end

When /^(.*) in the ([^\"]+) section$/ do |action, identifier|
  within_parent(identifier) do
    When action
  end
end

When /^(.*) in the "([^\"]*)" section:$/ do |action, title, table|
  within_parent(title, sections) do
    When "#{action}:", table
  end
end

When /^(.*) in the "([^\"]*)" row$/ do |action, title|
  within_parent(title, %w(th td)) do
    When action
  end
end

When /^(.*) in the "([^\"]*)" section before "([^\"]*)"$/ do |action, tag, title|
  within_parent_element(title, tag) do
    When action
  end
end

When /^(.*) in the section before "([^\"]*)"$/ do |action, title|
  within_parent_preceding(title, sections) do
    When action
  end
end

When /^(.*) in the "([^\"]*)" frame$/ do |action, identifier|
  within_frame(identifier) do
    When action
  end
end

Then /^(.*) (?:as|in|on|within) the (\d+)(?:\w+) ([^"]+)$/ do |action, position, identifier|
  within_identifier(identifier, position) do
    When action
  end
end

