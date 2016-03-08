# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  admin      :boolean
#

class User < ApplicationRecord

  has_many :episodes
  has_many :votes

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || auth['info']['email'].try(:split, '@').try(:first) || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end
