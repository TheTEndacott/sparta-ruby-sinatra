class PostsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # 'Temp demo dummy database'
  $cars = [{
     id: 0,
     title: "Subaru",
     body: "Impreza"
  },
  {
      id: 1,
      title: "Toyota",
      body: "Supra"
  },
  {
      id: 2,
      title: "Nissan",
      body: "Skyline"
  }];

  # INDEX
  get "/" do
    @title = "Cars Innit"
    @cars = $cars
    erb :"posts/index"
  end

  # NEW
  get "/new" do
    erb :"posts/new"
  end

  # SHOW
  get "/:id" do
    id = params[:id].to_i
    @cars = $cars[id]
    erb :"posts/show"
  end

  # CREATE
  post "/" do
    "This is the create route!"
  end

  # EDIT
  get "/:id/edit" do
    id = params[:id]
    "This is the edit route for #{id}!"
    erb :"posts/edit"
  end

  # UPDATE
  put "/:id" do
    id = params[:id]
    "This is the update route for #{id}!"
  end

  # DESTROY
  delete "/:id" do
    id = params[:id]
    "This is the destroy route for #{id}! <br> Destroy all humans!"
  end





end # Close PostsController