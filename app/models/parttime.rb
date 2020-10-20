class Parttime < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :pr_1
    validates :pr_2
    validates :pr_3
  end
end
