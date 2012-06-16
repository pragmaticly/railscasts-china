# == Schema Information
#
# Table name: episodes
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  permalink    :string(255)
#  description  :text
#  notes        :text
#  published_at :datetime
#  seconds      :integer
#  file_sizes   :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Episode < ActiveRecord::Base
  validates :name, presence: true
  validates :permalink, presence: true
  validates :description, presence: true
  validates :notes, presence: true
  validates :seconds, numericality: { greater_than: 0 }

  default_scope order: 'published_at DESC'
end
