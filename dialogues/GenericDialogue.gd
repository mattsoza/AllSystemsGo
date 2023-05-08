extends CanvasLayer

export(String, FILE, "*.json") var d_file

var dialog = []
var current_dialog_id = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	start()

func load_dialog():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, File.READ)
		return parse_json(file.get_as_text())
	
func _input(event):
	if event.is_action_pressed("interact"):
		next_script()
		
func next_script():
	current_dialog_id += 1
	
	$NinePatchRect/Name.text = dialog[current_dialog_id]['dialogs']['name']
	$NinePatchRect/Chat.text = dialog[current_dialog_id]['chat']

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
