class CreateAmazonSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :amazon_searches do |t|
      t.string :title,null: false
      t.string :subject,null: false
      t.text :body,null: false
      


      t.timestamps
    end
  end
end
