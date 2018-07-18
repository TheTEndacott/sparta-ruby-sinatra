class PostsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # 'Temp demo dummy database'
  # $cars = [{
  #    id: 0,
  #    title: "Subaru",
  #    body: "Impreza"
  # },
  # {
  #     id: 1,
  #     title: "Toyota",
  #     body: "Supra"
  # },
  # {
  #     id: 2,
  #     title: "Nissan",
  #     body: "Skyline"
  # }];

  # INDEX
  get "/" do
    @title = "Cars Innit"
    @posts = Post.all
    erb :"posts/index"
  end

  # NEW
  get "/new" do
    @posts = {
      id: "",
      title: "",
      body: ""
    }
    erb :"posts/new"
  end

  # SHOW
  get "/:id" do
    id = params[:id].to_i
    @posts = Post.find(id)

    erb :"posts/show"
  end

  # CREATE
  post "/" do
    post = Post.new

    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect "/"
  end

  # EDIT
  get "/:id/edit" do
    id = params[:id]
    @posts = Post.find(id)

    erb :"posts/edit"
  end

  # UPDATE
  put "/:id" do
    id = params[:id].to_i
    post = Post.find(id)
    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect "/"
  end

  # DESTROY
  delete "/:id" do
    # Get the id
    id = params[:id].to_i

    # delete the post from the db
    Post.destroy(id)

    # redirect back to the homepage
    redirect "/"
  end





end # Close PostsController