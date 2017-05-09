
class StateInStock
	attr_reader :idl,:usr,:memused, :time

	def initialize(idl, usr, time, memused)
		@idl = idl
		@usr = usr
		@time = time
		@memused = memused
	end
end
