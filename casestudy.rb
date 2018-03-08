require 'csv'
=begin
dataHash = CSV.read("Customers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_data = dataHash.map { |d| d.to_hash }

puts hashed_data

dataArray = Array.new

CSV.foreach("Customers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  dataArray << row.to_hash
end

puts dataArray
=end

###############################################

custArray = Array.new
custID = ""
innercustID = ""
salesHash = Hash.new
i = 0

CSV.foreach('Customers.csv', { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    amount = 0
    i = i + 1
    custID = row[10]

    if custArray.include?(custID) == false then

	    amount = amount + row[4].to_f
	    j = 0
	    CSV.foreach('Customers.csv', { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |innerrow|

		j = j+1
		innercustID = innerrow[10]

		if innercustID == custID then
			if i != j then
				amount = amount + innerrow[4].to_f
			end
		end
	    end 	

	    salesHash[custID] = amount
   	    custArray << custID
	end
end 

#salesHash.each {|key, value| puts "Amount of #{key} is #{value}"}

CSV.open('output.csv', 'w') do |csv|
csv << ['customerID', 'total sales', 'rank']

	newsalesHash = salesHash.sort_by{|key, value| value}.reverse.to_h
	k = 1
	newsalesHash.each do |key, value| 
		csv << [key, value, k]
		k = k +1
	end

end

