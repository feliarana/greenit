class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :admission_date
      t.string :telegram_id
      t.jsonb :bot_command_data, default: {}
      t.references :company

      t.timestamps
    end
  end
end
