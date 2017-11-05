class EmAnnuGhgKpsController < ApplicationController
  layout 'annual_emissions'

  before_action :set_page, only: %i[show edit update destroy]

  # GET /pages
  # GET /pages.json
  def index
    @substances = EmAnnu.all_substances
    @submissions = EmAnnu.all_submissions
    @q = EmAnnuGhgKp.ransack(params[:q])
    @results = @q.result(distinct: true).paginate(page: params[:page])
  end
end
