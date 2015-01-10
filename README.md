# LIFX Morse
[Morse code](http://en.wikipedia.org/wiki/Morse_code) generator for your [LIFX Smartbulb](http://lifx.co/) in [Ruby](https://www.ruby-lang.org).

### What it does:
 1. Connects to all lights on your network
 2. Blinks blue three times before the message
 3. Blinks quickly red for dot, blinks slower green for dash, pauses between letters and words
 4. Repeats the message
 
### See it in action:
[![LIFX Morse in action](http://img.youtube.com/vi/la-_FB2P3y8/0.jpg)](http://www.youtube.com/watch?v=la-_FB2P3y8)

### How to launch it on Mac:
First time:
```
sudo gem install lifx
```
Then:
```
./morse.rb <message>
```
