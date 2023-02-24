require 'one_ruby/movie'

RSpec.describe OneRuby::Movie do
  let(:quote_response) do
    {
      "docs": [
        {
          "_id": '5cd95395de30eff6ebccde56',
          "dialog": 'Man Flesh!',
          "movie": '5cd95395de30eff6ebccde50',
          "character": '5cd95395de30eff6ebccde51'
        },
        {
          "_id": '5cd95395de30eff6ebccde57',
          "dialog": 'Pippin!',
          "movie": '5cd95395de30eff6ebccde57',
          "character": '5cd95395de30eff6ebccde58'
        }
      ],
      "total": 8,
      "limit": 1000,
      "offset": 0,
      "page": 1,
      "pages": 1
    }
  end

  describe '.list' do
    it 'returns a list of quotes' do
      stub_request(:get,
                   OneRuby::ROOT_URL + 'movie/5cd95395de30eff6ebccde5b/quote?limit=2000').to_return(body: JSON.generate(quote_response))

      quotes = OneRuby::Quote.list('5cd95395de30eff6ebccde5b')
      expect(quotes.size).to eq(2)

      quote = quotes.shift
      expect(quote.id).to eq('5cd95395de30eff6ebccde56')
      expect(quote.dialog).to eq('Man Flesh!')
      expect(quote.movie_id).to eq('5cd95395de30eff6ebccde50')
      expect(quote.character_id).to eq('5cd95395de30eff6ebccde51')
    end
  end
end
