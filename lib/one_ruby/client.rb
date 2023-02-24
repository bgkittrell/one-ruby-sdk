module OneRuby
  class Client
    def self.get(path)
      results = RestClient.get OneRuby::ROOT_URL + path + '?limit=2000',
                               { Authorization: "Bearer #{OneRuby.api_key}" }
      JSON.parse(results)
    end
  end
end
