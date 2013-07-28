# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type

  version :thumb do
    process :resize_to_fit => [50,50]
  end

  version :preview do
    process :resize_to_fit => [80,80]
  end

  protected

  def images?(new_file)
    new_file.content_type.include? 'image'
  end

end
