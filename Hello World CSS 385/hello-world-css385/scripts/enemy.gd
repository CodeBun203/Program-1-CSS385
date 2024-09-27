extends Sprite2D

@onready var player := $"../Player"
var velocity
@export var speed = 100


# Handles movement
func _process(delta):
	velocity = (player.position - position).normalized() * speed
	position += velocity * delta
	
# Handles getting hit by bullet
func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("bullet"):
		print("hit!")
		get_parent().increment_score(1)
		queue_free()
