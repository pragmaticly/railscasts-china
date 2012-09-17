# coding: utf-8

title = "RailsCasts China"
author = "Terry Tai"
description = "RailsCasts China由太檑(Terry Tai)制作。 此网站的目的是帮助中国Rails/Ruby社区中的程序员更快更方便的掌握Rails/Ruby开发技巧。这些Screencasts主要针对入门和中级用户。当然如果高级用户也能从中发现一些值得借鉴或者批评的地方，我更是倍感荣幸。我将尽量遵循由浅入深，循序渐进的原则来制作视频。但总体来讲所有视频是互相独立的，所以并不是一个体系完整的教程。因此并不适合作为唯一学习手段，而是更适合作为一种辅助。最后，希望对你有所帮助。"
keywords = "rails, ruby on rails, screencasts, podcasts, tips, tricks, tutorials, training, programming, railscast, 中文"

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://railscasts-china.com'
    xml.description description
    xml.language 'zh'
    xml.pubDate @episodes.first.published_at.to_s(:rfc822)
    xml.lastBuildDate @episodes.first.published_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'poshboytl@gmail.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Technology' do
      xml.itunes :category, :text => 'Software How-To'
    end
    xml.itunes :category, :text => 'Education' do
      xml.itunes :category, :text => 'Training'
    end

    @episodes.each do  |episode|
      xml.item do
        xml.title "##{episode.padded_position} #{episode.name}"
        xml.description episode.description
        xml.pubDate episode.published_at.to_s(:rfc822)
        xml.enclosure :url => episode.asset_url, :length => episode.file_sizes, :type => 'video/mp4'
        xml.link episode_url(episode)
        xml.guid({:isPermaLink => "false"}, episode.permalink)
        xml.itunes :author, author
        xml.itunes :subtitle, truncate(episode.description, :length => 150)
        xml.itunes :summary, episode.description
        xml.itunes :explicit, 'no'
        xml.itunes :duration, episode.duration
      end
    end
  end
end
