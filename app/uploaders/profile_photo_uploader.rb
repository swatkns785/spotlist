# encoding: utf-8
class ProfilePhotoUploader < CarrierWave::Uploader::Base
  version :default

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "http://sellleadsucceed.files.wordpress.com/2014/02/bigstock-silhouette-with-a-question-mar-59367497.jpg"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
