class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do #read, index
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do #create, new
    erb :new
  end

  post '/recipes' do  #create, create
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{Recipe.last.id}"
  end

  get '/recipes/:id' do #read, show
    @recipe = Recipe.find(params[:id])
    # @recipe.ingredients = @recipe.ingredients.split
    # binding.pry
    erb :show
  end

  get '/recipes/:id/edit' do  #update, load edit form
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #update, edit action
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end



end
