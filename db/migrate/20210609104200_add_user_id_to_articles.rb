class AddUserIdToArticles < ActiveRecord::Migration[6.1]

  #this class use for add user_id into article table
  def change
    add_column :articles, :user_id, :integer
  end
end
