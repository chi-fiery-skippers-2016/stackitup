class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null:false
      t.integer :question_id, null:false
      t.integer :the_one_who_answers, null:false
      t.boolean :best?

      t.timestamps null:false
    end
  end
end
