require_relative 'lib/film_collection'
require_relative 'lib/film'

collection = FilmCollection.parse_wiki_films

puts 'Программа «Фильм на вечер»'

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'

pool_directors = collection.all_directors.sample(5)

pool_directors.each.with_index(1) { |director, index| puts "#{index}. #{director}" }

user_answer = STDIN.gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'

film = collection.all_films.find_all { |film| film.director == pool_directors[user_answer - 1] }.sample

puts film
