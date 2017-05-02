require 'gruff'
require_relative 'csv_reader'

	reader = CsvReader.new
	ARGV.each do |csv_file_name|
		STDERR.puts "Processing #{csv_file_name}" 
		reader.read_in_csv_data(csv_file_name)	
	end
	# puts reader.arr_cpu_idl


	cpu_line = Gruff::Line.new
	cpu_line.title = "CPU"
	# cpu_line.labels = date_
	cpu_line.data :cpu_idl, reader.cpu_idl
	cpu_line.data :cpu_usr, reader.cpu_usr
	cpu_line.line_width = 1
	cpu_line.y_axis_increment = 5 
	cpu_line.write('cpu.png')