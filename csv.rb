require_relative 'isbn_functions.rb'
require 'csv'

# numbers_arr = []

# CSV.foreach("csv/input_isbn_file.csv", ) do |row|
#     # p "#{row} is row before shift on csv file"
#     row.shift
#     # p "#{row} is row after shift on csv file"
#     numbers_arr << row
# end
#     # p numbers_arr
# CSV.open("csv/output_isbn_file.csv", "wb") do |csv|
#     csv << ["isbn_functions", "VALIDITY"]
#     numbers_arr.shift
#     numbers_arr.each do |num|
#         validity = master_function(num[0])
#         p "#{num} is num in numbers_arr loop"
#         if validity == true
#           validity = " Valid"
#         else
#            validity = " Invalid"
#         end
#         csv << [num.join, validity]
#     end
# end
def update_csv(num, result)
    CSV.open("csv/user_input_isbn_file.csv", "a+") do |csv|
        # csv << ["ISBN", "Validity"]
        p "#{result.join} is in update_csv"
        if result.join == "true"
            message = "Valid"
        else 
            message = "Invalid"
        end
    #      csv.each do |row|
    csv << [num, message]
    #     end
    end
end
# def generate_csv(num, result)
#     CSV.generate do |csv|
#         if result.join == "true"
#             message = "Valid"
#         else 
#             message = "Invalid"
#         end
#             csv << [num, message]
#         end
#         message.shift
#     message.each do |row|
#     message << row[0]
#     end
# end
# def show
#     @csv = CSV.open("csv/user_input_isbn_file.csv", :headers => true)
#   end
