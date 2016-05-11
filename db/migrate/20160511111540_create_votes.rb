class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, null:false, polymorphic:true

      t.timestamps null:false
    end
  end
end
