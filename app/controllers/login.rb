get '/login' do
  if request.xhr?
    status 200
    erb :'/sessions/_login', :layout => false
  else
    erb :'sessions/login'
  end
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    if request.xhr?
      if params[:title]
        @question = Question.find_by(title: params[:title])
        @answers = @question.answers
        erb :'/questions/show'
      else
        @questions = Question.all
        erb :'/questions/index', locals: {questions: @questions}
      end
    else
      redirect '/'
    end
  else
    redirect '/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
