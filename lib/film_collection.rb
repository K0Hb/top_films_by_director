require_relative 'film'
require 'nokogiri'
require 'open-uri'

class FilmCollection
  attr_reader :all_films

  def self.parse_wiki_films
    base_url = URI.escape('https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb')
    doc = Nokogiri::HTML(URI.open(base_url))
    films =
      doc.css('tr')[1..-1].map do |film|
        data_file = film.content.split("\n")
        data_file.delete("")
        name, year, director = data_file[1], data_file[2], data_file[3]
        Film.new(name, director, year)
      end
    new(films)
  end

  def initialize(films)
    @all_films = films
    @all_directors = []
  end

  def all_directors
    all_films.map(&:director).uniq
  end
end
