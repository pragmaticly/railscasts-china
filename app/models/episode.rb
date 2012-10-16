# == Schema Information
#
# Table name: episodes
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  description    :text
#  notes          :text
#  published_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  position       :integer(4)      default(0)
#  comments_count :integer(4)      default(0), not null
#  seconds        :integer(4)
#  file_sizes     :text
#  publish        :boolean(1)      default(FALSE)
#  still          :string(255)
#  user_id        :integer(4)      default(1)
#  video_url      :string(255)
#  download_url   :string(255)
#

class Episode < ActiveRecord::Base

  mount_uploader :still, StillUploader

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
  validates :position, numericality: { greater_than: 0 }

  before_validation :set_position
  before_create :set_published_at

  default_scope -> { order('position DESC') }

  scope :by_tag, lambda{ |tag_name| joins(:tags).where("tags.name = ?", tag_name) unless tag_name.blank? }

  def to_param
    permalink.to_s
  end

  #TODO Put the host and url to setting file latter.
  def asset_url
    video_url || default_url
  end

  def url_for_downloading
    download_url || asset_url
  end

  def default_url
    "http://screencasts.b0.upaiyun.com/assets/episodes/video/#{full_name}.mp4"
  end

  def still_url
    still.url || "http://screencasts.b0.upaiyun.com/assets/episodes/stills/#{full_name}.png"
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
    if position.nil?
      last_position = Episode.first.try(:position)
      self.position = (last_position.nil? ? 0 : last_position)  + 1
    end
  end
end
