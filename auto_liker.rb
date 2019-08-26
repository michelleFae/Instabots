require "watir"
require_relative 'credentials'
username = $username
password = $password

#open brower and navigate to login
browser = Watir::Browser.new :chrome
browser.goto "instagram.com/accounts/login/"

#navigate to username and password fields, inject info
puts "Logging in!"
browser.text_field(:name => "username").set username
browser.text_field(:name => "password").set password
like_count = 0

#Click login button
browser.button(:class => ['_0mzm-','sqdOP','L3NKy']).click

sleep(2)

#because I need to select 'not now' for turning on notifications
#TODO: CHECK IF BUTTON EXISTS
if browser.button(:class => ["aOOlW", "HoLwm"]).exists?
	browser.button(:class => ["aOOlW", "HoLwm"]).click
end



like_counter = 0




while true
	puts "line 29"

	puts "line 34"
	browser.buttons(:class => ["dCJp8", "afkep", "_0mzm-"]).each { |heart|
		if heart.span(:'aria-label' => "Like").exists?
			heart.click 
			like_counter += 1
		end	
	}
	
	puts "hi"
	sleep(5)


	# I'm not implementing a scroll in my program.

	# 3.times do |i|
	#  	browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight)")
	#  	sleep(2)
	# end	


end



sleep(330)

# #wanted_links = container.links.map(&:text)

# # Iterate through the links
# wanted_links.each do |link_text|
#   container = site.div(class: "column zn__column--idx-1")
#   container.link(text: link_text).click

#   site.back
# end