# == Schema Information
#
# Table name: taggings
#
#  id         :integer         not null, primary key
#  tag_id     :integer
#  episode_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :episodes
end
