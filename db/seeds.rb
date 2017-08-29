def create_books
  book = Book.new
  book.name = Faker::Book.title
  book.short_desc = Faker::Lorem.paragraph(2)
  book.long_desc = Faker::Lorem.paragraph(50)
  book.chapter_index = Faker::Number.between(1,5)
  book.dop = Faker::Date.backward
  book.genre = Book::GENRE.sample(2)
  book.save
  book
end

def create_authors
  author = Author.new
  author.name = Faker::Name.name
  author.bio = Faker::Lorem.paragraph(sentence_count = 50)
  author.picture = Faker::Avatar.image
  author.academics = Faker::Lorem.paragraph
  author.awards = Faker::Lorem.paragraph
  author.save
end

def create_reviews book
  review = book.reviews.new
  review.name = Faker::Name.name
  review.rating = Faker::Number.between(1,5)
  review.title = Faker::Lorem.paragraph(1)
  review.desc = Faker::Lorem.paragraph(sentence_count = 50)
  review.save
end

puts "Dumping records please wait while .... "

review = 1000.times { create_authors }
5000.times do
  book = create_books
  5.times { create_reviews(book) }
  book.authors << Author.all.to_a.sample
end 
puts "Creating index for Author"
Author.update_ngram_index
puts "Creating index for Book"
Book.update_ngram_index
puts "Script completed."
puts "-"*30
puts "Authors Count = #{Author.count}"
puts "Books Count = #{Book.count}"
puts "Reviews Count = #{Review.count}"
puts "-"*30