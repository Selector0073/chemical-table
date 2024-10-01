extends Node3D

var animation_player: AnimationPlayer = null

func _ready():
	animation_player = get_node("AnimationPlayer")


func _on_button_pressed():
	if animation_player:
		animation_player.play("start-animation")
	get_node("Button").queue_free()
