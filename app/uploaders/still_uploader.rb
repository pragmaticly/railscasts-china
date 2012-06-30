# encoding: utf-8

class StillUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

end
