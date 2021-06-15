class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, comment: "コメント" do |t|
      t.references :blog
      t.text :body, null: false, comment: "コメント本文"
      t.timestamps
    end
  end
end
