class QuestionsController < ApplicationController
  # index
  # def index
  #   @questions = Question.all
  # end

  # new
  def new
    @form = Form.find(params[:form_id])
    @question = Question.new

  end

  # create
  def create
    @form = Form.find(params[:form_id])
    @question = Question.create!(question_params.merge(form: @form))

    redirect_to new_form_question_path(@form)
  end

  def show
    @question = Question.find(params[:id])
    @form = Form.find(params[:form_id])
  end

  def edit
    @question = Question.find(params[:id])
    @form = Form.find(params[:form_id])
  end

  def update
    @question = Question.find(params[:id])
    @form = Form.find(params[:form_id])
    @question.update(question_params.merge(form: @form))
    redirect_to form_path(@form)
  end

  def destroy
    @form = Form.find(params[:form_id])
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to form_path(@form)
  end

  private
  def question_params
    params.require(:question).permit(:text, :answer)
  end
end
