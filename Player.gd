extends KinematicBody2D
onready var ray = $DirectionHeading
onready var skin = $Sprite
export var gridSize = 40


var inputs = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT, 
	"right": Vector2.RIGHT,
}

func _physics_process(delta):
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
				move(dir)

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
