module OneRuby
  class Quote
    attr_accessor :id, :dialog, :movie_id, :character_id

    def self.list(movie_id)
      results = OneRuby::Client.get "movie/#{movie_id}/quote"
      quotes = results['docs']
      quotes.map { |r| transform(r) }
    end

    def self.transform(response)
      quote = Quote.new
      quote.id = response['_id']
      quote.dialog = response['dialog']
      quote.movie_id = response['movie']
      quote.character_id = response['character']
      quote
    end
  end
end
