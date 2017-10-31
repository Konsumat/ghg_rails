# == Schema Information
#
# Table name: pbeissert.luc
#
#  luc_nr        :string(11)       not null, primary key
#  luc_abbr      :string(9)
#  luc_abbr_from :string(4)
#  luc_abbr_to   :string(4)
#  luc_name      :string(70)
#  luc_name_crf  :string(150)
#

class Luc < ActiveRecord::Base
  self.table_name = 'pbeissert.luc'
end
