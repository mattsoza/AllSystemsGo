extends Area2D

var activated = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$text.visible = false
	visible = false
	


func playerEnter():
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			return true


func interact():
	if Input.is_action_pressed("interact") and has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.is_in_group("player"):
				body.enterPuzzleMode()

func _on_puzzle_hidden():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !activated && Dialogic.VAR.cellDeath == true:
		visible = true
		activated = true
	if activated:
		interact()
		if playerEnter():
			$text.visible = true
		else:
			$text.visible = false
