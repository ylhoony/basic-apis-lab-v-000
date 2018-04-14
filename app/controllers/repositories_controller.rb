class RepositoriesController < ApplicationController

  def search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'd80d181bc323b63ff712'
      req.params['client_secret'] = 'f7852679b22cc112a4fed5f8e5ecc7c772b5304e'
      req.params['q'] = params[:query]
      req.options.timeout = 120
    end

    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'

    end



    d80d181bc323b63ff712
    f7852679b22cc112a4fed5f8e5ecc7c772b5304e

  end

  def github_search
  end
end
