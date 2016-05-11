class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :body, null:false
      t.references :votable, null:false, polymorphic:true
      t.boolean :up?, null:false

      t.timestamps null:false
    end
  end
end
