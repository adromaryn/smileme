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
  
  describe "signup page" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
        expect(page).to have_selector("#error_explanation")
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email",                 with: "user@example.com"
        fill_in "Password",              with: "foobar12"
        fill_in "Password confirmation", with: "foobar12"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      it "should redirect to user" do
      	click_button submit
      	expect(page).to have_selector("#login-text")
      	expect(page).to have_selector("#login-form")
      	expect(page).to have_selector("#notice")
      	expect(page).not_to have_selector("#error_explanation")
      end
    end
  end
  
  describe "signin" do
  	subject { page }
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_selector("h1", text: "Log in") }
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end
      
      it { should have_selector("#login-text", text: "#{user.login}")}
      it { should have_selector("#login-form", text: "")}
    end
  end
  
end
