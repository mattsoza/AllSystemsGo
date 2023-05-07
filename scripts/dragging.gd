extends Node2D

var selected = false
var correct = false
var finished = false

var rest_pt
var rest_zones = []
var piece
var zone

func _ready():
	#rest_zones = get_tree().get_nodes_in_group("zone")
	#rest_pt = rest_zones[0].global_position
	piece = get_node("ElementStone002")
	zone = get_node("dropZone")


func _on_area_2d_input_event(viewport, event, shape_idx):
	if(Input.is_action_just_pressed("click")):
		selected = true

		
func _physics_process(delta):
	if selected:
		piece.global_position = lerp(piece.global_position, get_global_mouse_position(), 50 * delta)
	elif finished:
		if correct:
			moveToZone(delta)
		
func moveToZone(delta):
	piece.global_position = lerp(piece.global_position, zone.global_position, 25 * delta)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = get_node("dropZone/Area2D/CollisionShape2D").shape.radius
			var distance = piece.global_position.distance_to(zone.global_position)
			if distance < shortest_dist:
				correct = true
			else:
				correct = false



