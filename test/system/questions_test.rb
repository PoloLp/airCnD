# test/system/questions_test.rb
require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase

# test text in page home
  test "visiting home page at '/'" do
    visit root_url
    assert_selector "h1", text: "Pages#home"
  end

# TO DO : write test for differents pages
  # test "test view index" do
    # visit ask_url
    # fill_in "question", with: "Hello"
    # click_on "Ask"
    # assert_text "I don't care, get dressed and go to work!"
  # end

# to take screenshots add 'take_screenshot'
end

