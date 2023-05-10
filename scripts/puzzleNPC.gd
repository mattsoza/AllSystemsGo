extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$text.visible = false
	


func playerEnter():
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			return true


func interact():
	if Input.is_action_pressed("interact") and has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.is_in_group("player"):
				body.enterPuzzleMode()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	interact()
	if playerEnter():
		$text.visible = true
	else:
		$text.visible = false
