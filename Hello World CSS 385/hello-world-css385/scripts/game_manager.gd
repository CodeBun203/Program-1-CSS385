extends Node2D

var score
var highscore
var highscore_file_path = "user://Savesss.save"

@export var enemy_spawn_radius = 1000
@export var inner_enemy_spawn_radius = 600

@onready var enemy = load("res://scenes/enemy.tscn")
@onready var player = $Player
@onready var spawn_timer = $SpawnTimer


func _ready():
	score = 0
	
	load_highscore()
	spawn_timer.start()
	

# Saves current highscore
func save_highscore():
	var file = FileAccess.open(highscore_file_path, FileAccess.WRITE)
	if file:
		file.store_var(highscore)
		file.close()
		print("Highscore saved")
	else:
		print("Failed to open save file")

# Loads highscore from file
func load_highscore():
	if FileAccess.file_exists(highscore_file_path):
		var file = FileAccess.open(highscore_file_path, FileAccess.READ)
		if file:
			highscore = file.get_var()
			file.close()
		else:
			print("Failed to open save file")
	else:
		highscore = 0
		print("Save file does not exist")
	increment_score(0)
			

# Updates score and highscore. Should've been name update_score()
# but I'm lazy
func increment_score(val):
	print("incrementing score")
	score += val
	$Score.text = "Score: %s" % score
	
	if score >= highscore:
		highscore = score
		save_highscore()
	
	$Highscore.text = "Highscore: %s" % highscore


func _on_spawn_timer_timeout():
	spawn_enemy()

# Spawns enemies in a range around the player not too far, but not too close
func spawn_enemy():
	var spawn_pos = player.position
	while spawn_pos.distance_to(player.position) < inner_enemy_spawn_radius:
		var angle = randf() * PI * 2
		var distance = randf() * enemy_spawn_radius
		spawn_pos = player.position + Vector2(cos(angle), sin(angle)) * distance
	
	var curr_enemy = enemy.instantiate()
	curr_enemy.position = spawn_pos
	add_child(curr_enemy)
	
# Resets highscore
func reset_highscore():
	highscore = 0
	increment_score(0)
	save_highscore()
