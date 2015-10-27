require 'rails_helper'

describe 'creating questions' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  it 'gets created', js: true do
    visit root_path
    click_link 'Questions'
    login_as(@user, :scope => :user)
    click_link "New Question"
    click_button 'Create Question'
    expect(page).to have_content "What would you rather"
  end
end

describe "when deleting questions" do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    @question = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer, question_id: @question.id, user_id: @user.id)
    @answer2 = FactoryGirl.create(:answer, question_id: @question.id, user_id: @user.id)
    visit questions_path
  end

  it "allows the user to remove them with AJAX", js: true do
    click_link "Delete"
    expect(page).to_not have_content("Would you")
    expect(page).to_not have_content(@answer.body)
  end

end

describe "when creating answers" do

  it "lets you add an answer", js: true do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    @question = FactoryGirl.create(:question, id: 5)
    #binding.pry
    visit '/questions/5'
  end

end
