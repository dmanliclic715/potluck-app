get "/users/new" do
  erb :"/users/new"
end

post "/users" do
  @user = User.new(email: params[:email], username: params[:username], password: params[:password])

  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end

get "/users/:id" do
  erb :"/users/show"
end
