extends Node2D

var current_dialog
# Called when the node enters the scene tree for the first time.
func _ready():
	current_dialog = Dialogic.start('intro')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
