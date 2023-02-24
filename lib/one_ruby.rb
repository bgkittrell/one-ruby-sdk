module OneRuby
  ROOT_URL = 'https://the-one-api.dev/v2/'

  class << self
    attr_accessor :api_key

    def config
      yield self
    end
  end
end
