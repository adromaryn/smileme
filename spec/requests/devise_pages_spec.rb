require 'rails_helper'

describe "Devise pages" do

  it "should have the right links on the layout" do
    visit root_path
    expect(page).to have_selector("h1", text: "Log in")
    expect(page).to have_selector("nav a[href = '#{new_user_registration_path}']")
    expect(page).to have_selector("nav a[href = '#{new_user_session_path}']")
    click_link "Forgot your password?"
    expect(page).to have_selector("h1", text: "Forgot your password?")
    expect(page).to have_selector("nav a[href = '#{new_user_registration_path}']")
    expect(page).to have_selector("nav a[href = '#{new_user_session_path}']")
    click_link "Sign up"
    expect(page).to have_selector("h1", text: "Sign up")
    expect(page).to have_selector("nav a[href = '#{new_user_registration_path}']")
    expect(page).to have_selector("nav a[href = '#{new_user_session_path}']")
  end
end
