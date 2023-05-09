extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func interact():
	if Input.is_action_pressed("interact") and has_overlapping_bodies():	
		var current_dialog = Dialogic.start('RedHelper1')
		add_child(current_dialog)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	interact()
