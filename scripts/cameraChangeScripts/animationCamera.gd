extends Camera2D

var played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$nonmatchingAnimation.visible = false

func takeControl():
	if Dialogic.VAR.viewGerm == true:
		enabled = true
		make_current()
	else:
		enabled = false
		
func playMatching():
	played = true
	$nonmatchingAnimation.visible = true
	$nonmatchingAnimation/AnimationPlayer.play("bacteria")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	takeControl()
	if Dialogic.VAR.germPresent == true && !played:
		playMatching()


func _on_animation_player_animation_finished(anim_name):
	visible = false
	
