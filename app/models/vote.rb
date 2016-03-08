# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  episode_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  election_id :integer
#

class Vote < ApplicationRecord
  belongs_to :episode, counter_cache: true
  belongs_to :user
end
