class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :image
      t.text :headline
      t.text :description
      t.text :source
      t.text :source_url

      t.timestamps
    end
  end
end
