extends Control
onready var song = $BackgroundMusic


func _on_BackgroundMusic_finished():
	song.playing = true
