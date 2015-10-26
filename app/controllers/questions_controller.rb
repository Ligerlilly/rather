class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :index, :create]

  def index
    @questions = Question.all.order(created_at: :desc)
    if params[:sort] == "popular"
      @questions = Question.all.order()
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      respond_to do |format|
        format.html { redirect_to questions_path, notice: 'Success!'}
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  private
    def question_params
      params.require(:question).permit(:user_id)
    end

    def find_question
      @question = Question.find(params[:id])
    end
end
