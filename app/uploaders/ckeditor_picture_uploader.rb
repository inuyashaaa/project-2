class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
  end

  process :extract_dimensions

  version :thumb do
    process resize_to_fill: [Settings.ckeditor.thumb_width,
      Settings.ckeditor.thumb_height]
  end

  version :content do
    process resize_to_limit: [Settings.ckeditor.content_width,
      Settings.ckeditor.content_height]
  end

  def extension_white_list
    Ckeditor.image_file_types
  end
end
