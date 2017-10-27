class EmAnnu < ActiveRecord::Base
  self.table_name = 'pbeissert.em_annu'
  #self.primary_key = 'luc_nr'

  def self.all_substances
    order("substance").pluck("substance").uniq
  end

  def self.all_submissions
    order("submission").pluck("submission").uniq
  end
end