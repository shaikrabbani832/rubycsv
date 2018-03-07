require 'csv'

dataHash = CSV.read("Customers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_data = dataHash.map { |d| d.to_hash }

puts hashed_data

dataArray = Array.new

CSV.foreach("Customers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  dataArray << row.to_hash
end

puts dataArray


###############################################

custArray = Array.new

CSV.open('output.csv', 'w') do |csv|
	csv << ['customerID', 'total sales', 'rank']
	i = 0
	
	CSV.foreach('Customers.csv') do |row|
	    amount = 0
	    i = i + 1
	    custID << row[10]
	    
	    
	    if custArray.include?(custID) = false then
		    puts "processing for customer -> #{custtID}"

		    amount = amount + row[4].to_f
		    j = 0
		    CSV.foreach('Customers.csv') do |innerrow|

			j = j+1
			innercustID << row[10]

			if innercustID = custID then
				if i != j then
					amount = amount + row[4].to_f
				end
			end if
		    end 	

		    puts "Customer id ==> #{custID} and total amount = #{amount}"
		    csv << [custID, amount, i]

		    custArray << custID
		end
	end   
end

