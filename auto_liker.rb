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

#likes given so far
like_count = 0

#max number of likes you want to give out for the day
max_likes = 20

#time in seconds before checking likes again (to save on processing space)
wait_time = 120


while true
	browser.buttons(:class => ["dCJp8", "afkep", "_0mzm-"]).each { |heart|
		if heart.span(:'aria-label' => "Like").exists?
			heart.click 
			like_count += 1
			puts "#{like_count} likes done!"
		end	
	}
	# I'm not implementing a scroll in my program ... want more of a live-like app running in the background
	# 3.times do |i|
	#  	browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight)")
	#  	sleep(2)
	# end	
	break if like_count >= max_likes
	sleep(wait_time) #time before checking likes again (to save on processing space)
end

puts "done all #{max_likes} like for the day! Bye!"