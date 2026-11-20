extends Area2D
@export var win_screen:CanvasLayer #drag your CAnvasLayer here in the Inspector

func _on_body_entered(body):
	if body.is_in_group("player"):
		win_screen.show_win()
