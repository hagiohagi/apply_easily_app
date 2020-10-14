FactoryBot.define do
  factory :owner do
    firstname             { Faker::Name.initials(number: 2) }
    lastname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end