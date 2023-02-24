require_relative 'one_ruby/client'
require_relative 'one_ruby/movie'
require_relative 'one_ruby/quote'
require_relative 'one_ruby/version'
module OneRuby
  ROOT_URL = 'https://the-one-api.dev/v2/'

  class << self
    attr_accessor :api_key

    def config
      yield self
    end
  end
end
