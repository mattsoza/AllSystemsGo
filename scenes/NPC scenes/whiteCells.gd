extends Node2D

var animation

var alreadyPlayed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func eatCell():
	if Dialogic.VAR.eatCell == true and not alreadyPlayed:
		animation = $AnimationPlayer
		animation.play("attack")
		alreadyPlayed = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	eatCell()
