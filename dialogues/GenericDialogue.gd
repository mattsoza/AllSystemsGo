extends CanvasLayer

var d_file = 'res://dialogues/json/ExampleDialogJson.json'

var dialog = null
var i = 0
var next_dialog_id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	"""
	Opens the file for use
	"""
	load_dialog()

func load_dialog():
	dialog = FileAccess.get_file_as_string(d_file)
	dialog = JSON.parse_string(dialog)
	return dialog

func _input(event):
	if event.is_action_pressed("interact"):
		next_script_piece()

func next_script_piece():
	"""
	Handles the changing of the 
	"""
	if i >= len(dialog[next_dialog_id]['dialogs']):
		i = 0
	next_script()
	i += 1

func next_script():
	"""
	Handles grabbing the next script that should be read from the JSON file
	"""
	$NinePatchRect/Name.text = dialog[next_dialog_id]['dialogs'][i]['name']
	$NinePatchRect/Chat.text = dialog[next_dialog_id]['dialogs'][i]['text']

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
