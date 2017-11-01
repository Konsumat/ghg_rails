class EmAnnuPoolsLulucf < ActiveRecord::Base
  self.table_name = 'pbeissert.em_annu_pools_lulucf'
  def self.all_luc_nrs
    order('luc_nr').pluck('luc_nr').uniq
  end

  def self.all_submissions
    order('submission').pluck('submission').uniq
  end
end
