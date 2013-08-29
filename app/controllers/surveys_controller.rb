class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: "Successfully created survey."
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)

      redirect_to @survey, notice: "Successfully updated survey."
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, notice: "Successfully destroyed survey."
  end

    private

    # Define survey_params using string paramaters because there is no attr_accessible in Rails 4
      def survey_params
        # Nest questions_attributes within the whitelisted attributes for survey_params. Nest answers_attributes within the whitelisted attributes for questions_params
        # Add :id and :_destroy as whitelisted attributes for poth questions_attributes and answers_attributes
        params.require(:survey).permit(:name, questions_attributes: [:id,:survey_id, :content, :_destroy, answers_attributes: [:id,:question_id, :content, :_destroy]]) 
      end

     def question_params
        params.require(:question).permit(:content, :survey_id)
      end

      def answer_params
          params.require(:answer).permit(:content, :question_id)
      end
end
