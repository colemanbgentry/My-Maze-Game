extends KinematicBody2D
onready var ray = $DirectionHeading
onready var timer = $Timer
onready var skin = $Sprite
export var gridSize = 40
var rng = RandomNumberGenerator.new()

var inputs = {
	0 : Vector2.UP,
	1 : Vector2.DOWN,
	2 : Vector2.LEFT, 
	3 : Vector2.RIGHT,
}

func move(dir):
	var vector_pos = inputs[dir] * gridSize
	if inputs[dir] == Vector2.UP:
		skin.rotation_degrees = 180
	if inputs[dir] == Vector2.DOWN:
		skin.rotation_degrees = 0
	if inputs[dir] == Vector2.LEFT:
		skin.rotation_degrees = 90
	if inputs[dir] == Vector2.RIGHT:
		skin.rotation_degrees = 270
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
		


func random_move():
	var move = rng.randi_range(0, 3)
	return move

func random_time():
	var time = rng.randi_range(1, 2)
	return time


func _on_Timer_timeout():
	var direction = random_move()
	var new_time = random_time()
	timer.paused = true
	move(direction)
	timer.wait_time = new_time
	timer.paused = false
