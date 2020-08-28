module BotCommand
  class Question < Base
    attr_accessor :questions

    def initialize(message, user)
      @questions = user.company.current_questions
      super(message, user)
    end

    def question
      factor = Factor.find_by(name: text)
      return nil if factor.blank?

      ::Question.find_by(factor_id: factor.id)
    end

    def should_ask?
      text =~ /\A\/preguntas/ || /\A\/cancelar/
    end

    def should_start?
      should_ask? || question.present?
    end

    def start
      return send_message('Aun no hay preguntas para tu compañia') if questions.blank?

      if question.present?
        user.reset_next_bot_command
        user.set_next_bot_command('BotCommand::Answer')
        user.set_question_id_to_answer(question.id)
        return send_message('Responda la cantidad usada para la pregunta seleccionada')

      end

      response = "Selecciona la pregunta para responder.\nPuede escribir /cancelar en cualquier momento para volver a desplegar las preguntas" #+ questions

      send_inline_options(response, questions)
      user.reset_next_bot_command
      user.set_next_bot_command('BotCommand::Question')
    end
  end
end
