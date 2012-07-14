# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  episode_id :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  ancestry   :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :episode, counter_cache: true
  belongs_to :user

  has_ancestry
end
