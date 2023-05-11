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
	#interact()
	eatCell()
	

func interact():
	#pass
	if Input.is_action_pressed("interact") and $Area2D.has_overlapping_bodies():
		for body in $Area2D.get_overlapping_bodies():
			if body.is_in_group("player"):
				var current_dialog = Dialogic.start('RedHelper1')
				add_child(current_dialog)
		


func _on_area_2d_area_entered(area):
	for body in $Area2D.get_overlapping_bodies():
		if body.is_in_group("player"):
			var current_dialog = Dialogic.start('whiteCells')
			add_child(current_dialog)
