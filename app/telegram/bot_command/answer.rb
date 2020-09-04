module BotCommand
  class Answer < Base
    attr_accessor :questions

    def should_start?
      text =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/ && text.to_i < 999_999
    end

    def start
      answer = ::Answer.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
                       .find_or_create_by(user: user, question_id: user.get_question_id_to_answer)
      answer.update(text: text)
      send_message("Respuesta del dia de hoy guardada correctamente.\n
        Escriba /preguntas para ver las restantes. \n
        Escriba /estadisticas para tus estadísticas. ")
      user.reset_next_bot_command
      user.set_next_bot_command('BotCommand::Question')
    end
  end
end
