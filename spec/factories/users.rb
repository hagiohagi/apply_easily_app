FactoryBot.define do
  factory :user do
    image                 { Faker::File.file_name(dir: 'path/to') }
    firstname             { '田中' }
    lastname              { '太郎' }
    firstname_kana        { 'たなか' }
    lastname_kana         { 'たろう' }
    email                 { Faker::Internet.free_email }
    sex                   { '男性' }
    password              { '1' + Faker::Internet.password(min_length: 7) }
    password_confirmation { password }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65)}
    phone_number          { Faker::Number.number(digits: 11) }
    postal_code           { Faker::Number.number(digits: 7) }
    prefecture_id         { '1' }
    city                  { Faker::Name.initials(number: 2) }
    building              { Faker::Name.initials(number: 2) }
    highschool            { Faker::Name.initials(number: 2) }
    h_admission           { '2000' }
    h_graduate            { '2000' }
    univercity            { Faker::Name.initials(number: 2) }
    u_admission           { '2000' }
    u_graduate            { '2000' }
    job_experience        { Faker::Name.initials(number: 2) }
    qualification_1       { Faker::Name.initials(number: 2) }
    q_year_1              { '2000' }
    qualification_2       { Faker::Name.initials(number: 2) }
    q_year_2              { '2000' }
    qualification_3       { Faker::Name.initials(number: 2) }
    q_year_3              { '2000' }
    station               { Faker::Name.initials(number: 2) }
    spouse                { Faker::Name.initials(number: 2) }
  end
end
