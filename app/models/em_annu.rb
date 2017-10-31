# == Schema Information
#
# Table name: pbeissert.em_annu
#
#  luc_nr          :string(11)
#  pool_abbr       :string(20)
#  submission      :integer
#  inventory_year  :integer
#  state_abbr      :string(2)
#  substance       :string(11)
#  unit            :string(6)
#  value           :decimal(, )
#  ad_notation_key :string(2)
#  ef_notation_key :string(2)
#

class EmAnnu < ActiveRecord::Base
  self.table_name = 'pbeissert.em_annu'
  self.primary_key = 'index_em_annu'

  def self.all_substances
    order("substance").pluck("substance").uniq
  end

  def self.all_submissions
    order("submission").pluck("submission").uniq
  end
end
