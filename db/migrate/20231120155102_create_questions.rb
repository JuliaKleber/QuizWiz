class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :choice_one
      t.string :choice_two
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
