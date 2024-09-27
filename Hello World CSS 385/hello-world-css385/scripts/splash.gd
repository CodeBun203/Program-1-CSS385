extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("splash")
	$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/hello_world.tscn")
