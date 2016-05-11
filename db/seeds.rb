3.times do
  user = User.create!(
    username: Faker::StarWars.character,
    email: Faker::Internet.email,
    hashword: Faker::Internet.password
    )
end

20.times do
  tag = Tag.create!(
    name: Faker::Book.genre
    )
end

15.times do
  vote = Vote.create!(
    votable_id: rand(10),
    votable_type: rand(1) == 1 ? 'app/models/question' : 'app/models/answer'
    )
end


30.times do
  response = Response.create!(
    body: Faker::StarWars.quote,
    # respondable: answer.id, question.id
    respondable_id: rand(10),
    respondable_type: rand(1) == 1 ? 'app/models/question' : 'app/models/answer'
    )
end

10.times do
  answer = Answer.create!(
    body: Faker::Lorem.sentence,
    question_id: rand(5),
    the_one_who_answers_id: rand(3),
    best?: false
    )
end


## CAN I COMMENT OR ANSWER ON MY OWN POST??




10.times do
  question = Question.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraph,
    author_id: rand(3),
    view_count: rand(1000)
    )
end

20.times do
  tagging = Tagging.create!(
     tag_id: rand(20),
     question_id: rand(10)
    )
end
