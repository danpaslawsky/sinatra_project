5.times do
    c = Category.find_or_create_by(genre: Faker::Book.genre)
    
end