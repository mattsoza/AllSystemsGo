extends Control
var pieces = []
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pieces = get_tree().get_nodes_in_group("puzzlePieces")
	$successText.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	finished = true
	for piece in pieces:
		if !piece.correct: 
			finished = false
			break
	if finished:
		Dialogic.VAR.madeHat = true
		for piece in pieces:
			piece.finished = true
		$successText.visible = true
		$Timer.start()
		

func _on_timer_timeout():
	visible = false
	$successText.visible = false
