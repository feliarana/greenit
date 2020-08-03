module BotCommand
  class Undefined < Base
    def start
      send_message('Comando desconocido. Escriba /start si sos un usuario nuevo, o intente con otro comando nuevamente.')
    end
  end
end
