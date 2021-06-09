class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.string :title, null: false, comment: "タイトル"
      t.text :body, null: false, comment: "本文"
      t.timestamps
    end
  end
end
