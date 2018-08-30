require 'aws-sdk-s3'
require 'csv'

load 'local_ENV.rb' if File.exist?('local_ENV.rb')

s3 = Aws::S3::Resource.new(region: 'us-east-1')
  obj = s3.bucket("michaelsmith19951-bucket1").object("csv/user_input_isbn_file.csv")
  File.open('csv/user_input_isbn_file.csv', 'rb') do |file|
  obj.put(body: file)
end