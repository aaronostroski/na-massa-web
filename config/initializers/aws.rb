if Rails.env.production? && Rails.env.staging?
  Aws.config.update({
    region: "sa-east-1",
    credentials: Aws::Credentials.new(Rails.application.credentials.s3[:key], Rails.application.credentials.s3[:secret]),
  })
end