class EmAnnuPoolsKpsController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
def index
  @luc_nrs = EmAnnuPoolsKp.all_luc_nrs
  @submissions = EmAnnuPoolsKp.all_submissions

  @q = EmAnnuPoolsKp.ransack(params[:q])
  @q.luc_nr_eq = @luc_nrs.first unless params[:q]
  @q.submission_eq = @submissions.first unless params[:q]
  @results = @q.result(distinct: true)
  @chart = LazyHighCharts::HighChart.new('graph') do |f|
    
    f.title(text: 'Time Series Pools')
    f.xAxis(categories: @results.map(&:inventory_year))
    
    all_series = @results.order('inventory_year asc').group_by { |x| x['pool_abbr'] }.map(&:last)
    all_series.each do |series|
      values = series.map(&:value)
      rounded_values = []
      values.each do |value|
        rounded_values << value.to_f.round(2)
      end
      f.series(name: series.first['pool_abbr'], data: rounded_values)
    end

    f.plot_options( { column: { stacking: "normal" } })

    f.yAxis [
      { title: { text: 'kt Co2-eq', margin: 70 } }
    ]
    f.chart(defaultSeriesType: 'column')
  end
   @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
     f.chart(
     )
     f.lang(thousandsSep: ',')
     #f.colors(['#90ed7d', '#f7a35c', '#8085e9', '#f15c80', '#e4d354'])
   end
  respond_to do |format|
    format.html
    format.csv { send_data @results.to_csv }
  end
  end
end
