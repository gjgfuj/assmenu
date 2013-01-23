require 'yaml'
def getc
	STDIN.getc
end
class ASSMenu
	def configure(exists, file)
		if exists
			@c = YAML.load(file)
		else
			@c = C.new
			puts "Configuration:"
			print "Please enter keys for 1-6 then press enter: "
			@c.k1 = getc
			@c.k2 = getc
			@c.k3 = getc
			@c.k4 = getc
			@c.k5 = getc
			@c.k6 = getc
			@c.nl = getc
			YAML.dump(@c, file)
		end
	end
	def call(menu)
		menu = $menus[menu]
		puts menu.name
		index = 0
		menu.function.call(self)
	end
	attr_reader :c
	class Menu
		def initialize(name, &function)
			@name = name
			@function = function
		end
		attr_reader :name, :function
	end
	class C
		attr_accessor :k1, :k2, :k3, :k4, :k5, :k6, :nl
	end
end
