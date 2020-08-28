class Quiz < ApplicationRecord
  belongs_to :company
  has_many :questions
  has_many :factors, through: :questions

  def public_questions
    questions.map(&:factor).map(&:name).split(',') if questions.any?
  end
end
