class Company < ApplicationRecord
  has_many :users
  has_many :quizzes

  def current_questions
    quizzes.last.public_questions if quizzes.any?
  end
end
