Aws.config.update({
    region: 'ap-southeast-2',
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
  })
  
  S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['arn:aws:s3:::ferret-adoption-pictures'])