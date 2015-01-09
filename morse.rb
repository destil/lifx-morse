#!/usr/bin/ruby

require 'lifx'

dot = -> lights {
    lights.set_color(LIFX::Color.red)
	sleep(0.8) 
	lights.turn_on 
	print "."
	sleep(0.5)
	lights.turn_off
}

dash = -> lights {
    lights.set_color(LIFX::Color.green)
	sleep(0.8)
	lights.turn_on
	print "-"
	sleep(1)
	lights.turn_off
}

def letterPause()
	print "|"
    sleep(2)
end

def wordPause() 
	print " "
	sleep(3)
end

def messagePause(lights)
	puts
	for i in 1..3 do
		lights.set_color(LIFX::Color.blue)
		sleep(0.8)
		lights.turn_on
		sleep(1)
		lights.turn_off
	end
end

alphabet = {
	"a" => [dot,dash],
	"b" => [dash,dot,dot,dot],
	"c" => [dash,dot,dash,dot],
	"d" => [dash,dot,dot],
	"e" => [dot],
	"f" => [dot,dot,dash,dot],
	"g" => [dash,dash,dot],
	"h" => [dot,dot,dot,dot],
	"i" => [dot,dot],
	"j" => [dot,dash,dash,dash],
	"k" => [dash,dot,dash],
	"l" => [dot,dash,dot,dot],
	"m" => [dash,dash],
	"n" => [dash,dot],
	"o" => [dash,dash,dash],
	"p" => [dot,dash,dash,dot],
	"q" => [dash,dash,dot,dash],
	"r" => [dot,dash,dot],
	"s" => [dot,dot,dot],
	"t" => [dash],
	"u" => [dot,dot,dash],
	"v" => [dot,dot,dot,dash],
	"w" => [dot,dash,dash],
	"x" => [dash,dot,dot,dash],
	"y" => [dash,dot,dash,dash],
	"z" => [dash,dash,dot,dot],
	"1" => [dot,dash,dash,dash,dash],
	"2" => [dot,dot,dash,dash,dash],
	"3" => [dot,dot,dot,dash,dash],
	"4" => [dot,dot,dot,dot,dash],
	"5" => [dot,dot,dot,dot,dot],
	"6" => [dash,dot,dot,dot,dot],
	"7" => [dash,dash,dot,dot,dot],
	"8" => [dash,dash,dash,dot,dot],
	"9" => [dash,dash,dash,dash,dot],
	"0" => [dash,dash,dash,dash,dash],
	" " => [ wordPause ]
}

# program starts

if ARGV.length != 1 
	printf "[!] usage: %s <message>\n" , $0
	exit(1)
end

client = LIFX::Client.lan
puts "Initializing ..."
sleep(1)

message = ARGV[0]

puts "Searching for lights on your network ..."

client.discover!

lights = client.lights

if lights.count == 0
	puts "No lights found on your network";
	exit(1);
end

puts "Sending morse code to all lights on your network"

loop do 
	messagePause(lights)

	message.each_char do |c|
		for f in alphabet[c.downcase()]
			f.(lights)
		end
		letterPause()
	end
end