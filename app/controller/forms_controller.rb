class FormsController < ApplicationController
  
  def index
    @user = User.find(session[:user]["id"])
    @forms = @user.forms
  end

  def new
    @form = Form.new
  end

  def create
    @user = User.find(session[:user]["id"])
    @form = @user.forms.create!(form_params)
    redirect_to new_form_question_path(@form)
  end

  def show
    @form = Form.find(params[:id])
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    @form.update(form_params)

    redirect_to form_path(@form)
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    redirect_to forms_path
  end

  private
  def form_params
    params.require(:form).permit(:title)
  end
end
