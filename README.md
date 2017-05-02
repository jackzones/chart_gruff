## Usage

`ruby chart_state.rb dstat.csv`

`dstat -cdnms --output ~/dstat.csv`
### gruff

```ruby
cpu_line.y_axis_increment = 5
cpu_line.data :cpu_usr, reader.cpu_usr
cpu_line.write('cpu.png')
```

### CsvReader

read the `csv`file

`compoment :cpu_idl` define `cpu_idl` method
### StateInStock

represent one state of the `csv`file

