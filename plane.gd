extends Node
#sounds
var swalk = global.swalk
var sdice = global.sdice
var scoin = global.scoin
var scard = global.scard
var schaos = global.schaos


func _ready():
	global.splay(global.sback)
	if fplane.p==-1:
		get_node("Plane").set_texture(fplane.pdef)
	else:
		get_node("Plane").set_texture(load(fplane.pdir+fplane.pname[fplane.psuf[fplane.p]]))
	fplane.pnode=get_node("Plane")
	fplane.dnode=get_node("VBoxContainer/Dice")
	
	#popup nodes
	fplane.poolpop=get_node("poolpop")
	fplane.poolpop1=get_node("poolpop/HBoxContainer/VBoxContainer/p1")
	fplane.poolpop2=get_node("poolpop/HBoxContainer/VBoxContainer/p2")
	fplane.poolpop3=get_node("poolpop/HBoxContainer/VBoxContainer/p3")
	fplane.poolpopbig=get_node("poolpop/HBoxContainer/pzoom")
	
#pass nodes to other scripts
func splay(sound):
	global.splay(sound)
	

func _on_New_pressed():
	if get_node_or_null("../Life"): get_node("../Life").l_new()
	fplane.p_new()
	
func _on_Dice_pressed():
	fplane.p_dice()

func _on_Coin_pressed():
	splay(scoin)
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var c=rng.randi_range(1,2)
	print(c)
	if c ==1:
		get_node("VBoxContainer/Coin").set_button_icon(load("res://media/ui/head.png"))
	elif c==2:
		get_node("VBoxContainer/Coin").set_button_icon(load("res://media/ui/tail.png"))



func _on_poolpopexit_pressed():
	fplane.pop_chaos_close()


func _on_p1_pressed():
	fplane.pop_chaos_button(1)
func _on_p2_pressed():
	fplane.pop_chaos_button(2)
func _on_p3_pressed():
	fplane.pop_chaos_button(3)
