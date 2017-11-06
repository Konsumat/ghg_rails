class EmAnnuGhgKpsController < ApplicationController
  layout 'annual_emissions'
  before_action :set_page, only: %i[show edit update destroy]
  def index
    @luc_names = EmAnnuGhgKp.all_luc_names
    @submissions = EmAnnuGhgKp.all_submissions

    @q = EmAnnuGhgKp.ransack(params[:q])
    @q.luc_name_eq = @luc_names.first unless params[:q]
    @q.submission_eq = @submissions.first unless params[:q]
    @results = @q.result(distinct: true)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "#{@q.luc_name_eq} #{@q.submission_eq}")
      f.xAxis(categories: @results.order('inventory_year').map(&:inventory_year).uniq.sort!)
      f.legend(layout: 'horizontal', align: 'center')
      all_series = @results.order('inventory_year').group_by { |x| x['substance'] }.map(&:last)
      all_series.each do |series|
        values = series.map(&:value)
        rounded_values = []
        values.each do |value|
          rounded_values << value.to_f.round(2)
        end
        f.series(name: series.first['substance'], data: rounded_values)
      end
      f.chart({renderTo: "chart1"})
      f.plot_options(column: { stacking: 'normal' })

      f.yAxis [
        { title: { text: 'kt Co2-eq', margin: 70 } }
      ]
      f.chart(defaultSeriesType: 'column')
    end
    respond_to do |format|
      format.html
      format.csv { send_data EmAnnuGhgKp.export(@results), type: 'text/csv; charset=utf-8; header=present', disposition: "attachment; filename=export.csv" }
    end
  end
end
