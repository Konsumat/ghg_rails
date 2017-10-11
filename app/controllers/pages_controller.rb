class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    sql = "select luc_nr, submission, pool_abbr, inventory_year, substance, unit, value from pbeissert.em_annu"
    @records_array = ActiveRecord::Base.connection.execute(sql)
  end
end
