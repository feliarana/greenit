module BotCommand
  class Undefined < Base
    def unknown_public_command
      send_message('Comando desconocido. Escriba /start para iniciar la conexion con tu compañia.')
    end

    def unknown_command
      if user.get_next_bot_command.safe_constantize == BotCommand::Answer
        return send_message('Escriba una respuesta numerica coherente para responder la pregunta actual.
                             /cancelar para volver al listado de preguntas')
      end

      send_message('Comando desconocido. Escriba /preguntas para ver el cuestionario.')
    end
  end
end
