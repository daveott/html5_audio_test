Then /^I should not get a "([\d]+)" response$/ do |code|
  page.status_code.should_not == code.to_i
end
