class QuestionsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :index]

def new
    
    @question = Question.new
    @question1 = Question.last
 
end

def index
  @questions_rate = Question.joins(:text_average).order('rating_caches.avg DESC')
  @questions = Question.order(:created_at).reverse()

end

def create
	@question = Question.new(question_params)
 	
    @question.user = current_user
 	  @question.save
  	redirect_to @question
end




  def show
  @question = Question.find(params[:id])

end

private
  def question_params
    params.require(:question).permit(:title, :text, :text1, :text2, :text3, :grade, :subject, :project_idea)
  end

  def like
  @question = Topic.find(params[:id])
  @question.likes.create
  redirect_to(questions_path)
end

end
