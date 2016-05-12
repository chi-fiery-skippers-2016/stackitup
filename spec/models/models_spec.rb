require_relative '../spec_helper'
require_relative '../../app/models/question'
require_relative '../../app/models/answer'
require_relative '../../app/models/user'
require_relative '../../app/models/response'

describe 'models' do
  let(:question) {Question.new(title: 'To be or not to be', body: 'That is the question', author_id: 1, view_count: 13)}

  let(:author) {User.new(username: 'Darth Vader', email: 'blowyourdeathstar@hotmail.com', hashword: 'passwordPasswordPassword')}

  let(:commenter) {User.new(username: 'old man', email: 'email@email.com', hashword: 'password')}

  let(:answer) {Answer.new(body: 'your shit sucks', question_id: 1, the_one_who_answers_id: 2, best?: false)}

  let(:response) {Response.new(body: 'this is a Star Wars quote', respondable_id: 1,
      respondable_type: 'question', user_id: 1
      )}

  let(:vote) {Vote.new(voteable_id: 1, voteable_type: 'question', voter_id: 2, up?: true)}

  let(:tag) {Tag.new(name: 'bahaha')}

  describe Question do

    it 'has a title' do
      expect(question.title).to eq('To be or not to be')
    end

    it 'has votes' do
      expect(question.votes[0].class).to be(Vote)
    end
  end
end
