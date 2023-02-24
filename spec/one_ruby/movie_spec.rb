RSpec.describe OneRuby::Movie do
  let(:movie_response) do
    {
      'docs' => [
        {
          '_id' => '5cd95395de30eff6ebccde56',
          'name' => 'The Lord of the Rings Series',
          'runtimeInMinutes' => 558,
          'budgetInMillions' => 281,
          'boxOfficeRevenueInMillions' => 2917,
          'academyAwardNominations' => 30,
          'academyAwardWins' => 17,
          'rottenTomatoesScore' => 94
        },
        {
          '_id' => '5cd95395de30eff6ebccde57',
          'name' => 'The Hobbit Series',
          'runtimeInMinutes' => 462,
          'budgetInMillions' => 675,
          'boxOfficeRevenueInMillions' => 2932,
          'academyAwardNominations' => 7,
          'academyAwardWins' => 1,
          'rottenTomatoesScore' => 66.33333333
        }
      ],
      'total' => 8,
      'limit' => 1000,
      'offset' => 0,
      'page' => 1,
      'pages' => 1
    }
  end

  describe '.list' do
    it 'returns a list of movies' do
      stub_request(:get, OneRuby::ROOT_URL + 'movie?limit=2000').to_return(body: JSON.generate(movie_response))

      movies = OneRuby::Movie.list
      expect(movies.size).to eq(2)
    end
  end

  describe '.find' do
    it 'returns a single movie' do
      stub_request(:get,
                   OneRuby::ROOT_URL + 'movie/5cd95395de30eff6ebccde56?limit=2000').to_return(body: JSON.generate(movie_response['docs'][0]))

      movie = OneRuby::Movie.find('5cd95395de30eff6ebccde56')
      expect(movie.id).to eq('5cd95395de30eff6ebccde56')
      expect(movie.name).to eq('The Lord of the Rings Series')
    end
  end

  describe '.transform' do
    it 'transforms JSON response into object' do
      movie = OneRuby::Movie.transform(movie_response['docs'][0])
      expect(movie.id).to eq('5cd95395de30eff6ebccde56')
      expect(movie.name).to eq('The Lord of the Rings Series')
      expect(movie.runtime_in_minutes).to eq(558)
      expect(movie.budget_in_millions).to eq(281)
      expect(movie.box_office_revenue_in_millions).to eq(2917)
      expect(movie.academy_award_nominations).to eq(30)
      expect(movie.academy_award_wins).to eq(17)
      expect(movie.rotten_tomatoes_score).to eq(94)
    end
  end
end
