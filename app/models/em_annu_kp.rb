
class EmAnnuKp < ActiveRecord::Base
  self.table_name = 'pbeissert.em_annu_kp'

  def self.all_substances
    order("substance").pluck("substance").uniq
  end

  def self.all_submissions
    order("submission").pluck("submission").uniq
  end

  def self.all_luc_nrs
    order("luc_nr").pluck("luc_nr").uniq
  end

    def self.all_pool_abbrs
    order("pool_abbr").pluck("pool_abbr").uniq
  end

end
