class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :deleted_at, :string
  end
end
