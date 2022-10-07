class CreateBooks < ActiveRecord::Migration[5.2]
  def change 
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :book_genre
      t.integer :number_of_pages
      t.text :book_review
      t.belongs_to :user
    end
  end
end
