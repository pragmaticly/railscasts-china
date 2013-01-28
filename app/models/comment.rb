# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  episode_id :integer
#  user_id    :integer
#  content    :text            not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  ancestry   :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :episode, counter_cache: true
  belongs_to :user
  validates :content, presence: true

  has_ancestry
end
