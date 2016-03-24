namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(login: "Example User",
                 email: "example@somemail.com",
                 password: "foobar12",
                 password_confirmation: "foobar12")
    99.times do |n|
      login  = Haikunator.haikunate
      email = "example-#{n+1}@somemail.com"
      password  = "password"
      User.create!(login: login,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
