$menus[:main] = ASSMenu::Menu.new("Main Menu") do |am, m|
	menuname am, m
	option am, m, 1, "Hello World!", :hello
	option am, m, 2, "Exit", :exit
	menugen am, m
	am.call(:main)
end
$menus[:hello] = ASSMenu::Menu.new("Hello World!") {|am, m| menuname(am,m); am.call :main}
