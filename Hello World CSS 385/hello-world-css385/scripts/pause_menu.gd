extends CanvasLayer

var paused

func _ready():
	hide()
	paused = false

func _input(event):
	if event.is_action_pressed("Pause"):
		toggle_pause()
		
func toggle_pause():
	if paused:
		Engine.time_scale = 1
		hide()
	else:
		show()
		Engine.time_scale = 0
	paused = !paused
		
func _on_resume_pressed():
	toggle_pause()
	
func _on_quit_pressed():
	get_tree().quit()


func _on_highscore_reset_pressed():
	get_parent().reset_highscore()
