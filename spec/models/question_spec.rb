require 'rails_helper'

describe Question do
  it { should belong_to :user }
  it { should have_many :answers }


  describe "when adding more than 2 answers to a question" do
    before do
      @question = Question.create!()
      @answer = Answer.create!(question_id: @question.id, body: "This is it", picture: "Picture")
      @answer2 = Answer.create!(question_id: @question.id, body: "This is it", picture: "Picture")
    end

    it "should fail and say that 'only 2 answer are allowed'" do
      @answer3 = Answer.new(question_id: @question.id, body: "This is it", picture: "Picture")

      expect(Answer.all.count).to eq 2
    end
  end

end
