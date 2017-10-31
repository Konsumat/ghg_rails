class EmAnnuKpsController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]

  # GET /pages
  # GET /pages.json
  def index
    @luc_nrs = EmAnnuKp.all_luc_nrs
    @pool_abbrs = EmAnnuKp.all_pool_abbrs
    @substances = EmAnnuKp.all_substances
    @submissions = EmAnnuKp.all_submissions
    @q = EmAnnuKp.order('inventory_year').ransack(params[:q])
    @em_annu_kps = @q.result(distinct: true).paginate(:page => params[:page])
  end
end
