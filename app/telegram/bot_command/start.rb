module BotCommand
  class Start < Base
    def should_start?
      text =~ /\A\/start/
    end

    def start
      send_message('
Bienvenido! Soy el bot realizado para la materia GreenIT.
Para ingresar a los questionarios, ingresa la contraseña de tu compañia: /pass keydetucompañia')
      # user.reset_next_bot_command
      # user.set_next_bot_command('BotCommand::Born')
    end

    def invalid_key
      send_message('
Contraseña de compañia inválida. Por favor, ingrese nuevamente /pass keydetucompañia')
      # user.reset_next_bot_command
      # user.set_next_bot_command('BotCommand::Born')
    end

    def daily_questions(user)
      questions = user.company.quizzes.last.questions.map(&:factor).map(&:name).join("\n")
      send_message('Estas son las preguntas para responder en el dia de hoy...........'+questions
      )
    end

    def send_question#(user)
      # questions = user.company.quizzes.last.questions.map(&:factor).map(&:name).join("\n")
      send_query('Estas son las preguntas para responder en el dia de hoy...........'
      )
    end
  end
end
