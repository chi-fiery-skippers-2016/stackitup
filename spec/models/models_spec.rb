require_relative '../spec_helper'
require_relative '../../app/models/question'
require_relative '../../app/models/answer'
require_relative '../../app/models/user'
require_relative '../../app/models/response'
require_relative '../../app/models/vote'

describe 'models-' do

  let!(:author) { User.create!(username: 'Darth Vader', email: 'blowyourdeathstar@hotmail.com', hashword: 'passwordPasswordPassword') }

  let!(:commenter) { User.create!(username: 'old man', email: 'email@email.com', hashword: 'password') }

  let!(:question) { Question.create!(title: 'To be or not to be', body: 'That is the question', author_id: author.id, view_count: 13) }

  let!(:answer) { Answer.create!(body: 'your shit sucks', question_id: question.id, theOneWhoAnswers_id: commenter.id, best?: false) }

  let!(:response) { Response.create!(body: 'this is a Star Wars quote', respondable: question, user_id: author.id) }

  let!(:vote) { Vote.create!(voteable: question, voter_id: commenter.id, up?: true) }

  let!(:tag) { Tag.create!(name: 'bahaha') }

  let!(:tagging) { Tagging.create!(tag_id: tag.id, question_id: question.id) }

  describe Question do
    it 'has a title' do
      expect(question.title).to eq('To be or not to be')
    end

    it 'has votes' do
      expect(question.votes[0]).to be_a(Vote)
    end

    it 'has taggings' do
      expect(question.taggings[0]).to be_a(Tagging)
    end

    it 'has tags' do
      expect(question.tags[0]).to be_a(Tag)
    end

    it 'has answers' do
      expect(question.answers[0]).to be_a(Answer)
    end

    it 'has responses' do
      expect(question.responses[0]).to be_a(Response)
    end

    it 'has an author' do
      expect(question.author).to be_a(User)
    end
  end

  describe User do
    it 'has questions' do
      expect(author.questions[0]).to be_a(Question)
    end

    it 'has answers' do
      expect(commenter.answers[0]).to be_an(Answer)
    end

    it 'has responses' do
      expect(author.responses[0]).to be_a(Response)
    end

    it 'has votes' do
      expect(commenter.votes[0]).to be_a(Vote)
    end
  end

  describe Vote do
    it 'belongs to a voteable' do
      expect(vote.voteable).to be_a(Question)
    end

    it 'belongs to a voter' do
      expect(vote.voter).to be_a(User)
    end
  end
end
