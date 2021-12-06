extends Node
var p1lt=global.p1lt
var p2lt=global.p2lt
var p3lt=global.p3lt
var p4lt=global.p4lt

func _on_Life_ready():
	global.splay(global.sback)
	update_lifetext(1)
	update_lifetext(2)
	update_lifetext(3)
	update_lifetext(4)
	
func _on_up11_pressed():
	p1lt=p1lt+1
	update_lifetext(1)
func _on_up51_pressed():
	p1lt=p1lt+5
	update_lifetext(1)
func _on_dn11_pressed():
	p1lt=p1lt-1
	update_lifetext(1)
func _on_dn51_pressed():
	p1lt=p1lt-5
	update_lifetext(1)
#player 2
func _on_up12_pressed():
	p2lt=p2lt+1
	update_lifetext(2)
func _on_up52_pressed():
	p2lt=p2lt+5
	update_lifetext(2)
func _on_dn12_pressed():
	p2lt=p2lt-1
	update_lifetext(2)
func _on_dn52_pressed():
	p2lt=p2lt-5
	update_lifetext(2)

#player 3
func _on_up13_pressed():
	p3lt=p3lt+1
	update_lifetext(3)
func _on_up53_pressed():
	p3lt=p3lt+5
	update_lifetext(3)
func _on_dn13_pressed():
	p3lt=p3lt-1
	update_lifetext(3)
func _on_dn53_pressed():
	p3lt=p3lt-5
	update_lifetext(3)
	
	#player 4
func _on_up14_pressed():
	p4lt=p4lt+1
	update_lifetext(4)
func _on_up54_pressed():
	p4lt=p4lt+5
	update_lifetext(4)
func _on_dn14_pressed():
	p4lt=p4lt-1
	update_lifetext(4)
func _on_dn54_pressed():
	p4lt=p4lt-5
	update_lifetext(4)

func update_lifetext(updateno):
	
	if updateno==1:
		get_node("Life1/VBoxContainer/p1").set_text(str(p1lt))
		if p1lt <= 0: get_node("Life1/VBoxContainer/p1").add_color_override("font_color", Color( 1, 0, 0, 1 ))
		else: get_node("Life1/VBoxContainer/p1").add_color_override("font_color", Color( 1, 1, 1, 1 ))
	elif updateno==2:
		get_node("Life2/VBoxContainer/p2").set_text(str(p2lt))
		if p2lt <= 0: get_node("Life2/VBoxContainer/p2").add_color_override("font_color", Color( 1, 0, 0, 1 ))
		else: get_node("Life2/VBoxContainer/p2").add_color_override("font_color", Color( 1, 1, 1, 1 ))
	elif updateno==3:
		get_node("Life3/VBoxContainer/p3").set_text(str(p3lt))
		if p3lt <= 0: get_node("Life3/VBoxContainer/p3").add_color_override("font_color", Color( 1, 0, 0, 1 ))
		else: get_node("Life3/VBoxContainer/p3").add_color_override("font_color",  Color( 1, 1, 1, 1 ))
	elif updateno==4:
		get_node("Life4/VBoxContainer/p4").set_text(str(p4lt))
		if p4lt <= 0: get_node("Life4/VBoxContainer/p4").add_color_override("font_color",Color( 1, 0, 0, 1 ))
		else: get_node("Life4/VBoxContainer/p4").add_color_override("font_color", Color( 1, 1, 1, 1 ))

func _on_Life_tree_exiting():
	global.p1lt=p1lt
	global.p2lt=p2lt
	global.p3lt=p3lt
	global.p4lt=p4lt

func _on_New_pressed():
	l_new()
	
func l_new():
		p1lt=global.ppld
		p2lt=global.ppld
		p3lt=global.ppld
		p4lt=global.ppld
		get_node("Life1/VBoxContainer/p1").set_text(str(p1lt))
		get_node("Life2/VBoxContainer/p2").set_text(str(p2lt))
		get_node("Life3/VBoxContainer/p3").set_text(str(p3lt))
		get_node("Life4/VBoxContainer/p4").set_text(str(p4lt))
		global.p1lt=p1lt
		global.p2lt=p2lt
		global.p3lt=p3lt
		global.p4lt=p4lt


func _on_Coin_pressed():
	global.splay(global.scoin)
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var c=rng.randi_range(1,2)
	print(c)
	if c ==1:
		get_node("VBoxContainer/Coin").set_button_icon(load("res://media/ui/head.png"))
	elif c==2:
		get_node("VBoxContainer/Coin").set_button_icon(load("res://media/ui/tail.png"))

