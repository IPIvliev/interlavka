# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/" + [version_name, "user_1.jpg"].compact.join('_')
  end

  process :resize_to_fill => [300, 300]

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

end
