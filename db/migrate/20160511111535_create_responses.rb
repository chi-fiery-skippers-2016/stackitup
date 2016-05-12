class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body, null:false
      t.references :respondable, null:false, polymorphic:true
      t.integer :user_id, null:false

      t.timestamps null:false
    end
  end
end
