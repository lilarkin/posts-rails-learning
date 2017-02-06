class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :body
      t.boolean :public

      t.timestamps
    end
  end
end
