get "/potlucks" do
  @potlucks = Potluck.order(time: :asc)
  erb :"/potlucks/index"
end

get "/potlucks/new" do
  redirect '/' if !logged_in?
  erb :"/potlucks/new"
end

post "/potlucks" do
    @potluck = Potluck.new(name: params[:name], location: params[:location], time: params[:time], user_id: session[:user_id])

    if @potluck.save
      redirect "/potlucks/#{@potluck.id}"
    else
      @errors = @potluck.errors.full_messages
      erb :"/potlucks/new"
    end
end


get "/potlucks/:id" do
  @potluck = Potluck.find(params[:id])
  erb :"/potlucks/show"
end

get "/potlucks/:id/edit" do
    @potluck = Potluck.find(params[:id])
  if logged_in? && (session[:user_id] == @potluck.user_id)
    erb :"/potlucks/edit"
  else
    redirect "/"
  end
end

put "/potlucks/:id" do
  @potluck = Potluck.find(params[:id])
  @potluck.assign_attributes(name: params[:name], location: params[:location], time: params[:time])
  if @potluck.save
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :"/potlucks/edit"
  end
end

delete "/potlucks/:id" do
    @potluck = Potluck.find(params[:id])
  if logged_in? && (session[:user_id] == @potluck.user_id)
    @potluck.destroy
    redirect "/potlucks"
  else
    redirect "/"
  end
end

post "/potlucks/:id/attendances" do
  @attendance = Attendance.new(dish: params[:dish], potluck_id: params[:id], user_id: session[:user_id])

    if @attendance.save
      redirect "/potlucks/#{params[:id]}"
    else
      @errors = @attendance.errors.full_messages
      @potluck = Potluck.find(params[:id])
      erb :"/potlucks/show"
    end
end
