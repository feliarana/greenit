class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :factor, null: false, foreign_key: true
      t.boolean :visible, default: true
    end
  end
end
