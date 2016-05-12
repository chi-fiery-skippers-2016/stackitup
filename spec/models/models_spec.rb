require_relative '../spec_helper'
require_relative '../../app/models/question'
require_relative '../../app/models/answer'
require_relative '../../app/models/user'
require_relative '../../app/models/response'

describe 'models' do
  let(:question) {Question.create(title: 'To be or not to be', body: 'That is the question', author_id: 1, view_count: 13)}

  let(:author) {User.create(username: 'Darth Vader', email: 'blowyourdeathstar@hotmail.com', hashword: 'passwordPasswordPassword')}

  let(:commenter) {User.create(username: 'old man', email: 'email@email.com', hashword: 'password')}

  let(:answer) {Answer.create(body: 'your shit sucks', question_id: 1, the_one_who_answers_id: 2, best?: false)}

  let(:response) {Response.create(body: 'this is a Star Wars quote', respondable_id: 1,
      respondable_type: 'question'
      )}

  describe Question do

    it 'has a title' do
      expect(question.title).to eq('To be or not to be')
    end

    it 'test' do
      expect(1).to eq(1)
    end

  end
end
