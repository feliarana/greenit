class Quiz < ApplicationRecord
  belongs_to :company
  has_many :questions
  has_many :factors, through: :questions
end
