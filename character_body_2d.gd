extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const FALL_LIMIT = 800.0
var spawn_point:Vector2
func _ready():
	spawn_point = global_position 
func _physics_process(delta):
	if not is_on_floor():
		velocity +=get_gravity() *delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y= JUMP_VELOCITY
	var direction = Input.get_axis("ui_left","ui_right")
	velocity.x = direction * SPEED
	if direction<0:
		$Sprite2D.flip_h = true
	elif direction>0:
		$Sprite2D.flip_h = false
	
	move_and_slide()
	if global_position.y > FALL_LIMIT:
		respawn()
		
func respawn():
	global_position = spawn_point
	velocity = Vector2.ZERO
