class DraftsController < ApplicationController
  # index
  def index
    @form = Form.find(params[:form_id])
    @drafts = @form.drafts
  end

  def new
    @draft = Draft.new
    @form = Form.find(params[:form_id])
    @questions = @form.questions
  end

  def create
    @form = Form.find(params[:form_id])
    @draft = Draft.create!(draft_params.merge(form: @form))

    redirect_to form_draft_path(@form, @draft)
  end

  def show
    @draft = Draft.find(params[:id])
  end

  def edit
    @draft = Draft.find(params[:id])
    @form = Form.find(params[:form_id])
  end

  def update
    @draft = Draft.find(params[:id])
    @form = Form.find(params[:form_id])
    @draft.update(draft_params.merge(form: @form))
    redirect_to form_draft_path(@draft.form, @draft)
  end

  def destroy
    @form = Form.find(params[:form_id])
    @draft = Draft.find(params[:id])
    @draft.destroy
    redirect_to form_path(@form)
  end

  private
  def draft_params
    params.require(:draft).permit(:text, :type, :title)
  end
end
