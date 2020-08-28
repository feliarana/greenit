class Quiz < ApplicationRecord
  belongs_to :company
  has_many :questions
  has_many :factors, through: :questions

  def public_questions
    questions.map(&:factor).map(&:name).map { |question| [question] }
  end
end
