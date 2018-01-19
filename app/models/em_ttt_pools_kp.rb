

class EmTttPoolsKp < ActiveRecord::Base
  
  default_scope { order('pool_abbr, inventory_year') }

  self.table_name = 'web_pbeissert.em_ttt_pools_kp'
  def self.all_luc_names
    order('luc_name').pluck('luc_name').uniq
  end
  
  def self.all_submissions
    order('submission DESC').pluck('submission').uniq
  end

  def self.all_state_name_ens
    order('state_name_en').pluck('state_name_en').uniq
  end

  def self.export(results)
    attributes = %w[luc_name pool_abbr submission inventory_year state_name_en substance unit value]
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes
      results.each do |row|
        csv << attributes.map { |attr| row.send(attr) }
      end
    end
  end
end
