require "sinatra"
require_relative "isbn_functions.rb"
require_relative "csv.rb"
require 'aws-sdk-s3'
require 'json'
require 'csv'
enable :sessions

load 'local_ENV.rb' if File.exist?('local_ENV.rb')

s3 = Aws::S3::Resource.new(region: 'us-east-1')


get '/' do
	result = session[:result] || []
  	isbn_number_input = session[:isbn_number_input] || []
  	p "#{result} is on / page"
  	p "#{isbn_number_input} is on / page"
  	csv = CSV.open("csv/user_input_isbn_file.csv", :headers => true)
  	p "#{csv.class} is csv class in update_csv"
  	erb :main_page, locals:{result: result, isbn_number_input: isbn_number_input, csv: csv}
end
post '/main_page' do
	num = params[:isbn_number_input].split("\r\n") || []
  	line_arr = []
  	val_arr = []
  	num.each do |n|
   		 val_arr << master_function(n)
   		 line_arr << n
   		end
   	valid = CSV.generate do |csv|
    csv << ["ISBN", "Validity"]
    val_arr.each_with_index do |v,i|
      csv << [line_arr[i], v]
    end
  end
   	session[:result] = val_arr
 	session[:isbn_number_input] = line_arr
 	p "result is #{val_arr}"
 	p "name is #{line_arr}"
 	update_csv(line_arr.first, session[:result])
  obj = s3.bucket("michaelsmith19951-bucket1").object("csv/user_input_isbn_file.csv")
    File.open('csv/user_input_isbn_file.csv', 'rb') do |file|
    obj.put(body: file)
  end
  # s3.put_object(bucket: 'michaelsmith19951-bucket1', body: "test", key: "user_input_isbn_file.csv")
 	redirect "/"
end