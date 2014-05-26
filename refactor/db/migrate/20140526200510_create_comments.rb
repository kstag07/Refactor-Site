class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :author_url
      t.string :user_ip
      t.string :author_email
      t.string :referrer
      t.text :content
      t.references :post, index: true

      t.timestamps
    end
  end
end
