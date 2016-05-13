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
    p "i'm authenticate"
    if request.xhr?
      p "i'm ajax"
      if params[:title]
        p "i have a title"
        @question = Question.find_by(title: params[:title])
        @answers = @question.answers
        erb :'/questions/show'
      else
        p "i have no title"
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


# post '/posts' do
#   puts params[:title]
#   post = Post.new( title: params[:title],
#                username: Faker::Internet.user_name,
#                comment_count: rand(1000) )
#   if request.xhr?
#     if post.save
#       status 200
#       erb :'_post', locals: { post: post }, :layout => false
#     else
#       status 422
#     end
#   else
#     redirect '/posts'
#   end
# end
