class Factor < ApplicationRecord
  has_many :questions
  has_many :quizzes, through: :questions
end
