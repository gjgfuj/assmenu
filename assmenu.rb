require 'yaml'
#Removes deprecation warning.
def getc
	STDIN.getc
end
#Class which controls the whole thing.
class ASSMenu
	#Configuration loading.
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
	#Call a specific menu
	def call(menu)
		menu = $menus[menu]
		menu.call(self)
	end
	attr_reader :c
	#Class for each menu.
	class Menu
		def initialize(name, &function)
			@name = name
			@function = function
			@options = []
		end
		def call(assmenu)
			@function.call(assmenu, self)
		end
		attr_reader :name, :function
		attr_accessor :options
	end
	#Configuration holder. Do not instantiate this yourself.
	class C
		attr_accessor :k1, :k2, :k3, :k4, :k5, :k6, :nl
	end
	#Helper Module. Use 'include ASSMenu::Helpers' to use.
	module Helpers
		#Name of menu. Pass a ASSMenu::Menu object in.
		def menuname(am, menu)
			puts menu.name
		end
		#Adds a new option to the menu
		def option(assmenu, menu, num, name, newmenu)
			puts num.to_s + ": " + name
			menu.options[k(assmenu, num)] = newmenu
		end
		#access a key quicker.
		def k(assmenu, num)
			eval("assmenu.c.k"+num.to_s)
		end
		#Generates the final menu.
		def menugen(assmenu, menu)
			print "Selection: "
			job = getc
			if job == assmenu.c.nl then job = getc end
			if menu.options[job]
				assmenu.call(menu.options[job])
			end
		end
	end
end
