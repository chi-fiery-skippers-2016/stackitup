get '/questions' do
  @questions = Question.all
  erb :index
=begin
Can sort questions by
recent - created_at
highest votes
trending -

=end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :show
end

get '/questions/:id/:sort' do
  puts "CONTROLLER"
  puts params
  p @question = Question.find(params[:id])
  p @answers = @question.answers
  case params[:sort]
  when "oldest"
    @answers = @answers.sort{|x,y| x.created_at <=> y.created_at}
  when "active"
    # puts @answers
    puts @answers[0].responses
    # if @answers.length <= 1
    #   return @answers
    # end
    # @answers = @answers.sort do |x,y|
    #   if x.responses.nil? && y.responses.nil?
    #     puts "well fuck you"
    #   elsif x.responses.nil?
    #     y <=> x
    #   elsif y.responses.nil?
    #     x <=> y
    #   else
    #     # puts y.responses
    #     # puts x.responses
    #     y.responses.last.created_at <=> x.responses.last.created_at
    #   end
    #   @answers
    # end
  when "votes"
    @answers = @answers.sort{|x,y| y.votes.count <=> x.votes.count}
  end
  erb :show
  # AJAX THIS SHIT LATER
end
