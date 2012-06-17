# == Schema Information
#
# Table name: episodes
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  description    :text
#  notes          :text
#  published_at   :datetime
#  seconds        :integer
#  file_sizes     :text
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  user_id        :integer
#  comments_count :integer         default(0)
#

class Episode < ActiveRecord::Base

  paginates_per 10

  has_many :comments
  belongs_to :user

  validates :name, presence: true
  validates :permalink, presence: true
  validates :description, presence: true
  validates :notes, presence: true
  validates :seconds, numericality: { greater_than: 0 }

  default_scope order: 'published_at DESC'

  def to_param
    permalink.to_s
  end

  def minutes
    seconds / 60
  end
end
