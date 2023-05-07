extends Node2D

var selected = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if(Input.is_action_just_pressed("click")):
		selected = true
		
		
		
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false

