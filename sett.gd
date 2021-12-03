extends Node

var full=0

func _ready():
	global.splay(global.sback)
	get_node("TabContainer/General/Options/dplt/no").set_text(str(global.ppld))
	get_node("TabContainer/General/Options/dalt/no").set_text(str(global.pald))
	get_node("TabContainer/General/Options/CheckBox").set_pressed(OS.window_fullscreen)


func _on_CheckBox_toggled(on):
		if on:
			OS.window_fullscreen =1
		else:
			OS.window_fullscreen =0



func _on_nop_text_entered(new_text):
	global.ppld=new_text
func _on_noa_text_changed(new_text):
	global.pald=new_text


func _on_screen_tree_exiting():
	global.save_settings()






