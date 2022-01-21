Given(/^I go to login page$/) do
  @heroku_app_asserts = Asserts::HerokuApp::HerokuAppAsserts.new
  @home_page = Pages::HerokuApp::HomePage.new.open_home_page
  @home_asserts = @heroku_app_asserts.home_page_asserts(@home_page)
end

Then('Verify URL is {string}') do |url|
  @home_asserts.verify_url(url)
end

Then('Verify Title is {string}') do |title|
  @home_asserts.verify_title(title)
end