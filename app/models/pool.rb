# == Schema Information
#
# Table name: pbeissert.pool
#
#  pool_abbr    :string(20)       not null, primary key
#  pool_name    :string(100)
#  pool_name_en :string(100)
#

class Pool < ActiveRecord::Base
  self.table_name = 'pbeissert.pool'
end
