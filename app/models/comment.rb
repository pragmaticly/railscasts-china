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
#

class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :episodes, counter_cache: true
end
