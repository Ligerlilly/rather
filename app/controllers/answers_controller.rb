class AnswersController < ApplicationController
  #before_action :load_question, only: :create
  before_action :find_question, except: [ :update ]

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user if current_user
    @answer.votes = 0
    if @answer.save
      respond_to do |format|
        format.html { redirect_to question_answers_path, notice: 'Success!'}
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end
  def edit

  end

  def update
    @answer = Answer.find(params[:id])
    @answer1_votes = @answer.question.answers.first.votes
    @answer2_votes = @answer.question.answers.last.votes
    user_id = current_user.id


    @click = Click.new({user_id: user_id, question_id: @answer.question.id})

    if @answer.increment!("votes") && @click.save
      respond_to do |format|
        format.js
      end
    else
    end
  end

  private

    def load_question

      resource, id = request.path.split('/')[1,2]
      @question = resource.singularize.classify.constantize.find(id)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      puts params
      params.require(:answer).permit(:body, :question_id, :picture)
    end
end
