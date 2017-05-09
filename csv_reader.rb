require 'csv'
require_relative 'state_in_stock'
require 'date'

class CsvReader

	def initialize
		@state_in_stock = []
	end

	def read_in_csv_data(csv_file_name) 
		CSV.foreach(csv_file_name, headers: true) do |row|
			@state_in_stock << StateInStock.new(row["idl"], row["usr"], row["time"], row["memused"]) 
		end
	end

#change the time of csv to array of the string
	def state_time
		arr = []
		@state_in_stock.each do |state|
			arr << state.time
		end
		arr.shift
		arr
	end

##change the column of csv to array of the float
	def self.compoment(name)
		define_method(name) do 
			arr = []
			a = name.to_s.split("_")
			b = a[1] 
			@state_in_stock.each do |state|
				arr << (state.send b.to_sym).to_f
			end
			arr.shift
			arr
		end	
	end

	compoment :cpu_idl
	compoment :cpu_usr
	compoment :memory_memused

#return the G of the memory_used
	def memory_used_with_g
		self.memory_memused.map { |i|  i / 1000000000.0}
	end
#x_aris time
	def state_n(n_hour)
		time_diff = (DateTime.parse(self.state_time[-1]) - DateTime.parse(self.state_time[0])) * 24 / n_hour
		time = (0..time_diff).map { |i| i * 1 }
	end
#x_aris time
	def x_label(n_second)
		hash = Hash.new
		if self.state_n(6).size == 1
			x_label_status(hash,n_second,1)
		else
			x_label_status(hash,n_second,6)			
		end

	end
#x_aris time
	def x_label_status(hash,n_second,n_hour)
		interval = n_hour * 60 * 60 / n_second
		self.state_n(n_hour).each_with_index do |item, index|
			hash[index * interval] = index * n_hour
		end
		hash
	end

end