before do
  @errors = Array.new
end

get "/sessions/new" do
  erb :"/sessions/new"
end

post "/sessions" do
  @user = User.find_by(username: params[:username])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors << "Invalid username and/or password. Try Again."
    erb :"/sessions/new"
  end
end

delete "/sessions/logout" do
  session[:user_id] = nil
  redirect "/sessions/new"
end
