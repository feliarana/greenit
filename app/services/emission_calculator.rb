class EmissionCalculator
  PESO_RESMA_A4 = 3
  CANT_RESMA_A4 = 500
  PESO_HOJA_A4 = 0.006

  attr_reader :answers

  def calculate_emission(answers)
    answers.sum do |answer|
      answer.text.to_i * answer.question.factor.emission_per_hour
    end
  end
end
