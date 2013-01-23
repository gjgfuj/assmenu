$menus[:main] = ASSMenu::Menu.new("Main Menu") do |assmenu|
	puts "1: Hello World!"
	puts "2: Exit."
	job = getc
	if job == assmenu.c.nl then job = getc end
	if job == assmenu.c.k1
		puts "Hello World"
	elsif job == assmenu.c.k2
		exit(0)
	end
	assmenu.call(:main)
end
