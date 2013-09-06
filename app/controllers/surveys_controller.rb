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
    if @survey.valid?
      @survey.save
      redirect_to @survey
    else
      flash[:errors] = @survey.errors
      render "new"
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    @survey.update_attributes(survey_params)
    if @survey.valid?
      @survey.save
      redirect_to @survey
    else
      flash[:errors] = @survey.errors
      render "edit"
    end
  end

  def destroy
    Survey.destroy(params[:id])
    redirect_to root_path
  end

  private

  def survey_params
    params.require(:survey).permit(:name,
      :questions_attributes => [:id, :content, :_destroy,
        :answers_attributes => [:id, :content, :_destroy],
      ],
      :questions => [:id, :content, :_destroy,
        :answers => [:id, :content, :_destroy],
      ])
  end

end
