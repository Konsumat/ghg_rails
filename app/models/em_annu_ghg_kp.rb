# == Schema Information
#
# Table name: pbeissert.em_annu_ghg_kp
#
#  luc_nr         :string(11)
#  submission     :integer
#  inventory_year :integer
#  state_abbr     :string(2)
#  substance      :string(11)
#  unit           :string(6)
#  value          :decimal(, )
#

class EmAnnuGhgKp < ActiveRecord::Base
  self.table_name = 'pbeissert.em_annu_ghg_kp'
end
