class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cuteness, inclusion: { in: 1..10, message: "must be between 1 and 10" }
  validates :softness, inclusion: { in: 1..10, message: "must be between 1 and 10" }
end
