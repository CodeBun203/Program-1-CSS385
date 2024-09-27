extends Sprite2D

@export var rot_speed = 1

var bullet = load("res://scenes/bullet.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		rotation -= rot_speed * delta
	if Input.is_action_pressed("right"):
		rotation += rot_speed * delta
	if Input.is_action_just_pressed("shoot"):
		shoot()
		print("shoot")

# Loads bullets at bullet spawn
func shoot():
	var curr_bullet = bullet.instantiate()
	curr_bullet._initialize(get_child(0).global_position, get_child(0).global_rotation)
	add_sibling(curr_bullet)
	print(curr_bullet.position)
	
