CarrierWave.configure do |config|
  if Rails.env.production? or Rails.env.development?
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['POCHOUR_S3_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['POCHOUR_S3_SECRET_KEY']
    }
    config.fog_directory  = ENV['POCHOUR_S3_BUCKET']
    # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.storage = :file
  end
end
