extends Node2D

var animation


# Called when the node enters the scene tree for the first time.
func _ready():
	animation = $AnimationPlayer
	animation.play("attack")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
