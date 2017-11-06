
class EmTttKp < ActiveRecord::Base

  default_scope { order('inventory_year') }

  self.table_name = 'pbeissert.em_ttt_kp'

  def self.all_substances
    order('substance').pluck('substance').uniq
  end

  def self.all_submissions
    order('submission').pluck('submission').uniq
  end

  def self.all_luc_names
    order('luc_name').pluck('luc_name').uniq
  end

  def self.all_pool_name_ens
    order('pool_name_en').pluck('pool_name_en').uniq
  end

  def self.all_state_name_ens
    order('state_name_en').pluck('state_name_en').uniq
  end

  def self.export(results)
    attributes = %w[luc_name pool_name_en submission substance inventory_year state_name_en unit value]
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes
      results.each do |row|
        csv << attributes.map { |attr| row.send(attr) }
      end
    end
  end

end
