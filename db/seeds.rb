3.times do
  user = User.create!(
    username: Faker::StarWars.character,
    email: Faker::Internet.email,
    hashword: Faker::Internet.password
    )
end

5.times do
  tag = Tag.create!(
    name: Faker::Team.creature
    )
end

10.times do
  question = Question.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraph,
    author_id: rand(3) + 1,
    view_count: rand(1000)
    )
  sleep(0.1)
end

10.times do
  answer = Answer.create!(
    body: Faker::Lorem.sentence,
    question_id: rand(10) + 1,
    theOneWhoAnswers_id: rand(3) + 1,
    best?: false
    )
  sleep(0.1)
end

30.times do
  response = Response.create!(
    body: Faker::StarWars.quote,
    respondable: rand(2) == 1 ? Question.all.sample : Answer.all.sample,
    user_id: rand(3) + 1
    )
  sleep(0.1)
end
## CAN I COMMENT OR ANSWER ON MY OWN POST??


20.times do
  tagging = Tagging.create!(
     tag_id: rand(20) + 1,
     question_id: rand(10) + 1
    )
end

num = rand(3)
if num == 0
  15.times do
  vote = Vote.create!(
    voteable: Question.all.sample,
    voter_id: rand(3) + 1,
    up?: rand(2) == 1 ? true : false
    )
  end
elsif num == 1
  15.times do
  vote = Vote.create!(
    voteable: Answer.all.sample,
    voter_id: rand(3) + 1,
    up?: rand(2) == 1 ? true : false
    )
  end
else
  15.times do
  vote = Vote.create!(
    voteable: Response.all.sample,
    voter_id: rand(3) + 1,
    up?: rand(2) == 1 ? true : false
    )
  end
end
