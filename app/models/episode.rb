# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  description    :text
#  notes          :text
#  published_at   :datetime
#  seconds        :integer
#  file_sizes     :text
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#  comments_count :integer          default(0)
#  still          :string(255)
#  publish        :boolean
#  position       :integer          default(0)
#  video_url      :string(255)
#  download_url   :string(255)
#  election_id    :integer
#  votes_count    :integer          default(0)
#  allow_download :boolean
#  allow_comment  :boolean
#

class Episode < ApplicationRecord

  mount_uploader :still, StillUploader

  paginates_per 10

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes
  belongs_to :user
  belongs_to :election

  validates :name, presence: true
  validates :permalink, presence: true, uniqueness: true
  validates :description, presence: true
  validates :notes, presence: true
  validates :seconds, numericality: { greater_than: 0 }
  validates :position, numericality: { greater_than: 0 }

  before_validation :set_position
  before_create :set_published_at

  default_scope { order('position DESC') }

  scope :by_tag, lambda { |tag_name| joins(:tags).where("tags.name = ?", tag_name) unless tag_name.blank? }
  scope :by_keywords, lambda { |keywords| where("episodes.name REGEXP ?", "#{keywords.split(" ").join('|')}") unless keywords.blank? }
  scope :published, lambda { where(publish: true) }

  def to_param
    permalink.to_s
  end

  #TODO Put the host and url to setting file latter.
  def asset_url
    video_url.blank? ? default_url : video_url
  end

  def url_for_downloading
    download_url.blank? ? asset_url : download_url
  end

  def default_url
    "http://screencasts.b0.upaiyun.com/assets/episodes/video/#{full_name}.mp4"
  end

  def still_url
    still.url.blank? ? "http://screencasts.b0.upaiyun.com/assets/episodes/stills/#{full_name}.png" : still.url
  end

  def padded_position
    position.to_s.rjust(3, "0")
  end

  def full_name
    "#{padded_position}-#{permalink}"
  end

  def minutes
    seconds / 60
  end

  def duration
    if seconds
      min, sec = *seconds.divmod(60)
      [min, sec.to_s.rjust(2, '0')].join(':')
    end
  end

  attr_accessor :tag_list

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tags_string)
    tags_string.split(',').each do |tag|
      tag = tag.strip
      self.tags << ::Tag.where(name: tag).first_or_create unless self.tags.collect(&:name).include?(tag)
    end
    self.tags
  end

  protected

  def set_published_at
    #TODO before add setting published_at, just make it the same with craeted_at
    self.published_at = self.created_at
  end

  def set_position
    if position == 0
      last_position = Episode.first.try(:position)
      self.position = (last_position.nil? ? 0 : last_position)  + 1
    end
  end
end
