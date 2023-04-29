extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$dialog.visible = false

func interact():
	if Input.is_action_pressed("interact") and has_overlapping_bodies():
		$dialog.visible = true
	elif !has_overlapping_bodies():
		$dialog.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	interact()
