class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null:false
      t.string :category

      t.timestamps null:false
    end
  end
end
