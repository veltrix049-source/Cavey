extends CanvasLayer
func _ready():
 hide()

func show_win():
 show()
 get_tree().paused = true

func _on_restart_button_pressed(): 
 get_tree().paused = false
 get_tree().change_scene_to_file("res://node_2d.tscn")
