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
#  still          :string(255)
#

class Episode < ActiveRecord::Base

  mount_uploader :stil, StillUploader

  paginates_per 10

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user

  validates :name, presence: true
  validates :permalink, presence: true
  validates :description, presence: true
  validates :notes, presence: true
  validates :seconds, numericality: { greater_than: 0 }

  default_scope order: 'published_at DESC'

  scope :by_tag, lambda{ |tag_name| joins(:tags).where("tags.name = ?", tag_name) unless tag_name.blank? }

  def to_param
    permalink.to_s
  end

  def minutes
    seconds / 60
  end

  def add_tags!(tags_string)
    tags_string.split(',').each do |tag|
      tag = tag.strip
      self.tags << ::Tag.find_or_create_by_name(tag) unless self.tags.collect(&:name).include?(tag)
    end
    self.tags
  end

end
