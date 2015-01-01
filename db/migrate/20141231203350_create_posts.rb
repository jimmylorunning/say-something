# rails g model Posts title:string content:text user:references
# http://stackoverflow.com/questions/8742633/rails-model-has-many-belongs-to-relations
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
