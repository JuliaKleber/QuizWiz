class AddCorrectChoiceToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :correct_choice, :string
  end
end
