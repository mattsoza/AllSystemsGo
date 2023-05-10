extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func takeControl():
	if Dialogic.VAR.viewGerm == true:
		enabled = true
		make_current()
	else:
		enabled = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	takeControl()
