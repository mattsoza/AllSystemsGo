extends CharacterBody2D

# Establish our characters direction to interface with objects
var direction: Vector2 = Vector2()
var puzzleActive = false
var lockPlayer = false
var showedReceptor = false


func _ready():
	var current_dialog = Dialogic.start('intro')
	add_child(current_dialog)
	
	$puzzle.visible = puzzleActive
	
func changeHat():
	var puzzle = get_node('puzzle')
	if puzzle.finished:
		var char_tex = load("res://assets/NPCs/researcherWithHat.png")
		var sprite = get_node('Sprite2D')
		sprite.texture = char_tex

# function for movement
func handle_movement():
	if Input.is_action_pressed("up"):
		velocity.y = -200
		direction = Vector2(0, -1)
	if Input.is_action_pressed("down"):
		velocity.y = 200
		direction = Vector2(0, 1)
	if Input.is_action_pressed("left"):
		velocity.x = -200
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("right"):
		velocity.x = 200
		direction = Vector2(1, 0)
		
	if Input.is_action_just_released("up") or Input.is_action_just_released("down"):
		velocity.y = 0
	if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		velocity.x = 0
		
	if !Input.is_anything_pressed():
		velocity.x = 0
		velocity.y = 0
	
	
	move_and_slide()
	
func enterPuzzleMode():
	lockPlayer = true
	$puzzle.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !lockPlayer && !Dialogic.VAR.lockPlayer:
		handle_movement()
	else: 
		velocity = Vector2(0,0)
	if Dialogic.VAR.showReceptor == true && showedReceptor == false:
		playAnimation()
	changeHat()

func playAnimation():
	showedReceptor = true
	$Camera2D/matchingAnimation.visible = true
	$Camera2D/matchingAnimation/AnimationPlayer.play("bacteria")
		

func _on_puzzle_hidden():
	lockPlayer = false


func _on_animation_player_animation_finished(anim_name):
	$Camera2D/matchingAnimation.visible = false
