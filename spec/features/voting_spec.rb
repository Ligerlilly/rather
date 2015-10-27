require 'rails_helper'

describe "when voting on questions" do

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    @question = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer, question_id: @question.id, user_id: @user.id)
    @answer2 = FactoryGirl.create(:answer, question_id: @question.id, user_id: @user.id)
    visit questions_path
  end

  it "hides the vote count before the user has voted", js: true do
    expect(page).to_not have_content "1"
    click_link @answer.body, match: :first
    expect(page).to have_content "1"
    expect(page).to_not have_link @answer.body
  end
end
