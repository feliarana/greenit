class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :text
      t.string :awnser_kind
      t.references :question
      t.references :user

      t.timestamps
    end
  end
end
