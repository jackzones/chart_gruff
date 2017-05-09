require 'gruff'
require_relative 'csv_reader'

	reader = CsvReader.new
	ARGV.each do |csv_file_name|
		STDERR.puts "Processing #{csv_file_name}" 
		reader.read_in_csv_data(csv_file_name)	
	end

###cpu

	cpu_line = Gruff::Line.new							#实例
	cpu_line.title = "CPU"								#title
	cpu_line.hide_lines = true							#点图
	cpu_line.labels = reader.x_label(5)                 #dstat 5
	cpu_line.y_axis_label = "%"							#y轴显示名称
	cpu_line.x_axis_label = "h"							#x轴显示名称
	cpu_line.data :cpu_idl, reader.cpu_idl				#cpu_idl数据
	cpu_line.y_axis_increment = 5 						#y轴增量
	cpu_line.write('cpu_https_digest_set.png')			#图片名


###memery

	mem_line = Gruff::Line.new
	mem_line.title = "Memory"
	mem_line.hide_lines = true
	mem_line.labels = reader.x_label(5)
	mem_line.y_axis_label = "G"
	mem_line.x_axis_label = "h"
	mem_line.data :memory_used, reader.memory_used_with_g
	mem_line.write('mem_https_digest_set.png')
