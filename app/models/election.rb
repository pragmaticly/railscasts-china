# == Schema Information
#
# Table name: elections
#
#  id                        :integer          not null, primary key
#  name                      :string(255)      not null
#  max_allowed_vote_per_user :integer
#  created_at                :datetime
#  updated_at                :datetime
#

class Election < ApplicationRecord
  has_many :episodes
end
