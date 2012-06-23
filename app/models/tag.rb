# == Schema Information
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :episodes, through: :taggings
end
