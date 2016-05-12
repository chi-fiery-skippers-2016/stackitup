class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body, null:false
      t.references :respondable, null:false, polymorphic:true
      t.integer :user_id, null:false
      t.integer :score, default:0

      t.timestamps null:false
    end
  end
end
