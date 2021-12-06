extends Node
#sounds
var swalk = global.swalk
var sdice = global.sdice
var scoin = global.scoin
var scard = global.scard
var schaos = global.schaos

onready var SCHEME = get_node("HSplitContainer/Scheme")

#arch life
var plt=global.plt

func _ready():
	global.splay(global.sback)
	if farch.s==-1:
		SCHEME.set_normal_texture(farch.sdef)
	else:
		SCHEME.set_normal_texture(load(farch.sdir+farch.sname[farch.ssuf[farch.s]]))
	#pass nodes to other scripts
	farch.snode=SCHEME
	
	#Scheme Store Function
	farch.popnode=get_node("PopupPanel")
	farch.popscheme=get_node("PopupPanel/HBoxContainer/PopScheme")
	farch.storenode=get_node("HSplitContainer/store")
	farch.schemestore=[]
	for i in 16:
		farch.schemestore.append(get_node("HSplitContainer/store/store"+str(i+1)))
	farch.schemeerror=get_node("TooManySchemes")	
	
	get_node("ConContainer/Life/VBoxContainer/ll").set_text(str(plt))

	

func splay(sound):
	global.splay(sound)
	

func _on_New_pressed():
	farch.s=-1
	get_node("ConContainer/Life/VBoxContainer/ll").set_text(str(plt))
	plt=global.pald
	SCHEME.set_normal_texture(farch.sdef)
	global.splay(global.scard)
	#farch.s_new()
	
	

func _on_Coin_pressed():
	splay(scoin)
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var c=rng.randi_range(1,2)
	print(c)
	if c ==1:
		get_node("ConContainer/Coin").set_button_icon(load("res://media/ui/head.png"))
	elif c==2:
		get_node("ConContainer/Coin").set_button_icon(load("res://media/ui/tail.png"))



func _on_Scheme_pressed():
	if farch.s == -1:
		farch.s_new()
	else:
		farch.s_cycle()


func _on_up1_pressed():
	plt=plt+1
	update_lifetext()
func _on_up5_pressed():
	plt=plt+5
	update_lifetext()
func _on_dn1_pressed():
	plt=plt-1
	update_lifetext()
func _on_dn5_pressed():
	plt=plt-5
	update_lifetext()

func update_lifetext():
	get_node("ConContainer/Life/VBoxContainer/ll").set_text(str(plt))
	if plt <= 0: get_node("ConContainer/Life/VBoxContainer/ll").add_color_override("font_color", Color( 1, 0, 0, 1 ))
	else: get_node("ConContainer/Life/VBoxContainer/ll").add_color_override("font_color", Color( 1, 1, 1, 1 ))


func _on_arch_tree_exiting():
	global.plt=plt


func _on_store1_pressed(): farch.store_popup(1-1)
func _on_store2_pressed(): farch.store_popup(2-1)
func _on_store3_pressed(): farch.store_popup(3-1)
func _on_store4_pressed(): farch.store_popup(4-1)
func _on_store5_pressed(): farch.store_popup(5-1)
func _on_store6_pressed(): farch.store_popup(6-1)
func _on_store7_pressed(): farch.store_popup(7-1)
func _on_store8_pressed(): farch.store_popup(8-1)
func _on_store9_pressed(): farch.store_popup(9-1)
func _on_store10_pressed(): farch.store_popup(10-1)
func _on_store11_pressed(): farch.store_popup(11-1)
func _on_store12_pressed(): farch.store_popup(12-1)
func _on_store13_pressed(): farch.store_popup(13-1)
func _on_store14_pressed(): farch.store_popup(14-1)
func _on_store15_pressed(): farch.store_popup(15-1)
func _on_store16_pressed(): farch.store_popup(16-1)


func _on_remove_pressed():
	farch.unstore()
func _on_back_pressed():
	farch.popnode.hide()
	global.splay(global.sback)
