class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :text
      t.string :answer_kind
      t.references :question
      t.references :user

      t.timestamps
    end
  end
end
