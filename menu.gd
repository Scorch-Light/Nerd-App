extends Node

func _ready():
	global.splay(global.sback)
	
func _on_Arch_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://arch.tscn")
func _on_Plane_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://plane.tscn")
func _on_Plane_Life_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://planelife.tscn")
func _on_Life_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://life.tscn")
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		global.splay(global.sback)
		get_tree().quit() # default behavior

