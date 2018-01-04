

class EmAnnuGhgKp < ActiveRecord::Base
  
  default_scope { order('substance, inventory_year') }

  self.table_name = 'pbeissert.em_annu_ghg_kp'
  def self.all_luc_names
    order('luc_name').pluck('luc_name').uniq
  end

  def self.all_submissions
    order('submission').pluck('submission').uniq
  end

  def self.export(results)
    attributes = %w[luc_name submission inventory_year substance unit value]
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes
      results.each do |row|
        csv << attributes.map { |attr| row.send(attr) }
      end
    end
  end
end
