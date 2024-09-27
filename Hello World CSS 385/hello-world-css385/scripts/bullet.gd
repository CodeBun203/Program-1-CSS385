extends Sprite2D

@export var speed = 500 

# Ensures bullet is spawned at correct transform
func _initialize(pos, rot):
	position = pos
	rotation = rot

# Handles movement and destruction of bullets
func _physics_process(delta):
	var direction = transform.y.normalized()
	var velocity = direction * speed
	position -= velocity * delta

	if abs(position.x) > 3000 || abs(position.y) > 3000:
		queue_free()
		print("destroyed")
