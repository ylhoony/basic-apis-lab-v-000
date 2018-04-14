class RepositoriesController < ApplicationController

  def search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'd80d181bc323b63ff712'
      req.params['client_secret'] = 'f7852679b22cc112a4fed5f8e5ecc7c772b5304e'
      req.params['q'] = params[:query]
      req.options.timeout = 120
    end

    binding.pry

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'd80d181bc323b63ff712'
      req.params['client_secret'] = 'f7852679b22cc112a4fed5f8e5ecc7c772b5304e'
      req.params['q'] = params[:query]
      req.options.timeout = 120
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body
    else
      @error = body["meta"]["errorDetail"]
    end

    render 'search'
    
  end
end
