class EmAnnuPoolsLulucfsController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  def index
    @luc_nrs = EmAnnuPoolsLulucf.all_luc_nrs
    @submissions = EmAnnuPoolsLulucf.all_submissions

    @q = EmAnnuPoolsLulucf.ransack(params[:q])
    @q.luc_nr_eq = @luc_nrs.first unless params[:q]
    @q.submission_eq = @submissions.first unless params[:q]
    @results = @q.result(distinct: true)
    end
end
