extends Node


#Views
const main=0
const arch=1
const plane=2
const life=3
const olife=4

var ppld=20
var p1lt=ppld
var p2lt=ppld
var p3lt=ppld
var p4lt=ppld

var pald=40
var plt=pald


#sounds
var sback = preload("res://media/sound/back.ogg")
var scard = preload("res://media/sound/card.ogg")
var schaos = preload("res://media/sound/chaos.ogg")
var scoin = preload("res://media/sound/coin.ogg")
var sdice = preload("res://media/sound/dice.ogg")
var slife = preload("res://media/sound/life.ogg")
var ssett = preload("res://media/sound/sett.ogg")
var stoggle = preload("res://media/sound/toggle.ogg")
var swalk = preload("res://media/sound/walk.ogg")


var audio = null

func _ready():
	load_settings()
	print(OS.get_user_data_dir())
	#pass
# warning-ignore:unused_argument
func splay(sound):
	#audio = node
	sound.loop = false
	audio.set_stream(sound)
	audio.play()
	

func save_settings():
	var file = File.new()
	file.open("user://config.dat", File.WRITE)
	
	#settings
	file.store_line(var2str(OS.window_fullscreen))
	file.store_line(var2str(ppld))
	file.store_line(var2str(pald))
	
	#close
	file.close()
	
func load_settings():
	var file = File.new()
	file.open("user://config.dat", File.READ)
	if file.file_exists("user://config.dat"):
		#settings
		OS.window_fullscreen= str2var(file.get_line())
		ppld = str2var(file.get_line())
		pald = str2var(file.get_line())
	#close
	file.close()
