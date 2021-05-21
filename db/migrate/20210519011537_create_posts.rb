class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title
      t.string :tagline
      t.text :body
      t.belongs_to :user
      t.timestamps
    end
  end
end
