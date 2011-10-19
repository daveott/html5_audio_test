Then /^(?:|I )should see the following table:$/ do |table|
  table.diff! tableish("table tr", "td,th")
end

Then /^(?:|I )should see the following list:$/ do |table|
  table.raw.each_with_index do |element, i|
    page.should have_xpath("//li[#{i+1}][contains(normalize-space(.), '#{element.first}')]")
  end
end
