class AddUsernameFavmovieToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :favorite_movie, :string
  end
end