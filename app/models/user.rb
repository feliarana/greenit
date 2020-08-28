class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :answers

  belongs_to :company

  validates_uniqueness_of :telegram_id

  def set_next_bot_command(command)
    self.bot_command_data['command'] = command
    save
  end

  def get_next_bot_command
    bot_command_data['command']
  end

  def set_question_id_to_answer(id)
    self.bot_command_data['question_id'] = id
    save
  end

  def get_question_id_to_answer
    bot_command_data['question_id']
  end

  def reset_next_bot_command
    self.bot_command_data = {}
    save
  end

  def display_name
    self.email
  end
end
