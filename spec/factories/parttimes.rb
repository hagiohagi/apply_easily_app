FactoryBot.define do
  factory :parttime do
      sun_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      sun_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      mon_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      mon_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      tue_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      tue_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      wed_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      wed_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      thu_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      thu_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      fri_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      fri_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      sat_parttime_in { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      sat_parttime_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      pr_1 {"あ"}
      pr_2 {"い"}
      pr_3 {"う"}
    end
end
