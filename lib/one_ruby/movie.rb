module OneRuby
  class Movie
    attr_accessor :id, :name, :runtime_in_minutes, :budget_in_millions, :box_office_revenue_in_millions,
                  :academy_award_nominations, :academy_award_wins, :rotten_tomatoes_score

    def self.list
      results = OneRuby::Client.get 'movie'
      movies = results['docs']
      movies.map { |r| transform(r) }
    end

    def self.find(id)
      movie = OneRuby::Client.get "movie/#{id}"
      transform(movie)
    end

    def self.transform(response)
      movie = Movie.new
      movie.id = response['_id']
      movie.name = response['name']
      movie.runtime_in_minutes = response['runtimeInMinutes']
      movie.budget_in_millions = response['budgetInMillions']
      movie.box_office_revenue_in_millions = response['boxOfficeRevenueInMillions']
      movie.academy_award_nominations = response['academyAwardNominations']
      movie.academy_award_wins = response['academyAwardWins']
      movie.rotten_tomatoes_score = response['rottenTomatoesScore']
      movie
    end
  end
end
