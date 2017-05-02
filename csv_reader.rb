require 'csv'
require_relative 'state_in_stock'

class CsvReader

	def initialize
		@state_in_stock = []
	end

	def read_in_csv_data(csv_file_name) 
		CSV.foreach(csv_file_name, headers: true) do |row|
			@state_in_stock << StateInStock.new(row["idl"], row["usr"]) 
		end
	end

	# def cpu_idl
	# 	arr = []
	# 	@state_in_stock.each do |state|
	# 		arr << state.idl.to_f
	# 	end
	# 	arr
	# end

	def self.compoment(name)
		define_method(name) do 
			arr = []
			a = name.to_s.split("_")
			b = a[1]
			@state_in_stock.each do |state|
				arr << (state.send b.to_sym).to_f
			end
			arr
		end
			
	end

	compoment :cpu_idl
	compoment :cpu_usr

end