class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  # code actions here!
  get '/' do
      redirect "/recipes"
    end

    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

    get '/recipes/new' do
      @recipe = Recipe.new
      erb :new
    end

    post '/recipes' do
      @recipe = Recipe.create(params)
      redirect "/recipes/#{@recipe.id}"
    end

    get '/recipes/:id' do
      @recipe = Recipe.find(params[:id])
      erb :show
    end

    get '/recipes/:id/edit' do
      @give = Recipe.find(params[:id])
      erb :edit
    end

    patch '/recipes/:id' do
      @recipe = Recipe.find(params[:id])
      @recipe.update(params[:recipe])
      redirect to "/recipes/#{@recipe.id}"
    end

    delete '/recipes/:id' do
      # @recipe = Recipe.find(params[:id])
      # @recipe.delete
        Recipe.destroy(params[:id])
      redirect to "/recipes"
    end

end
