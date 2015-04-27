Given(/^user is at the check in page$/) do
  visit check_in_new_path
end

Given(/^user is checked in$/) do
  steps %Q{
    Given user is at the check in page
    Given user submits new check in
  }
end

When(/^user submits new check in$/) do
  @username = "new usename"
  @dialect = "Yoda"

  fill_in :username, :with => @username
  select @dialect, :from => :dialect

  click_button "Check In"
end

When(/^user visits check in page$/) do
  visit check_in_new_path
end

When(/^user submits new check in without username$/) do
  @dialect = "Yoda"

  select @dialect, :from => :dialect

  click_button "Check In"
end

Then(/^user should be at home page$/) do
  expect(current_url).to eq(chat_index_url)
end

Then(/^user should see his info$/) do
  expect(page).to have_content(@username)
  expect(page).to have_content(@dialect)
end

Then(/^user should be redirected to chat page$/) do
  expect(current_url).to eq(chat_index_url)
end

Then(/^user should stay at check in page$/) do
  expect(current_url).to eq(check_in_new_url)
end

Then(/^user should see message that username must be specified during check in$/) do
  expect(page).to have_content("Username must be specified during check in")
end
