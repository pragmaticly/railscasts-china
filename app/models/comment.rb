# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  episode_id :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  ancestry   :string(255)
#
# Indexes
#
#  index_comments_on_ancestry  (ancestry)
#

class Comment < ApplicationRecord
  belongs_to :episode, counter_cache: true
  belongs_to :user
  validates :content, presence: true

  has_ancestry
end
