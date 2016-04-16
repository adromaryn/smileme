FactoryGirl.define do
  factory :user do
    login     "example_user"
    about     "Newable guy"
    email     "example@somemail.com"
    password  "foobar12"
    password_confirmation "foobar12"
  end
end
