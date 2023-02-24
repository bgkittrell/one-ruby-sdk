RSpec.describe OneRuby do
  describe '.config' do
    it 'stores the api key' do
      OneRuby.config do |config|
        config.api_key = '1234'
      end

      expect(OneRuby.api_key).to eq('1234')
    end
  end
end
