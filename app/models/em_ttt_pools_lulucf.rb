

class EmTttPoolsLulucf < ActiveRecord::Base
  
  default_scope { order('pool_abbr, inventory_year') }

  self.table_name = 'pbeissert.em_ttt_pools_lulucf'
  def self.all_luc_names
    order('luc_name').pluck('luc_name').uniq
  end

  

  def self.all_submissions
    order('submission').pluck('submission').uniq
  end

  def self.export(results)
    attributes = %w[luc_name submission substance inventory_year unit value]
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes
      results.each do |row|
        csv << attributes.map { |attr| row.send(attr) }
      end
    end
  end
end