# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  episode_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :episodes
end
