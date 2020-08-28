class Question < ApplicationRecord
  has_many :answers
  belongs_to :quiz
  belongs_to :factor
end
