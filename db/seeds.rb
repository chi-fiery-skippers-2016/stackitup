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
    voteable_type: rand(2) == 1 ? 'question' : 'answer',
    voteable_id: 1 + rand(9),
    voter_id: rand(3) + 1,
    up?: rand(2) == 1 ? true : false
    )
end


30.times do
  response = Response.create!(
    body: Faker::StarWars.quote,
    respondable_type: rand(2) == 1 ? 'question' : 'answer',
    respondable_id: rand(9) + 1,
    user_id: rand(3) + 1
    )
end

10.times do
  answer = Answer.create!(
    body: Faker::Lorem.sentence,
    question_id: 1 + rand(4),
    the_one_who_answers_id: 1 + rand(2),
    best?: false
    )
end


## CAN I COMMENT OR ANSWER ON MY OWN POST??




10.times do
  question = Question.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraph,
    author_id: 1 + rand(2),
    view_count: rand(1000)
    )
end

20.times do
  tagging = Tagging.create!(
     tag_id: 1 + rand(19),
     question_id: 1 + rand(9)
    )
end
