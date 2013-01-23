$menus[:main] = ASSMenu::Menu.new("Main Menu") do |am, m|
	m.menuname am
	m.option am, 1, "Hello World!", :hello
	m.option am, 2, "Exit", :exit
	m.menugen am
	am.call :main
end
$menus[:hello] = ASSMenu::Menu.new("Hello World!") {|am, m| m.menuname(am); am.call :main}
