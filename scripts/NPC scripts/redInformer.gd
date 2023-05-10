extends Area2D

func _ready():
	pass

func interact():
	if Input.is_action_pressed("interact") and has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.is_in_group("player"):
				
				var current_dialog = null
				if Dialogic.VAR.talkedToRedHelper == true:
					current_dialog = Dialogic.start('redInformer2')
				else:
					current_dialog = Dialogic.start('redInformer1')
				add_child(current_dialog)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	interact()
