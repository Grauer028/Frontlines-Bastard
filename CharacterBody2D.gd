extends CharacterBody2D

const SPEED = 600
const BULLET_SCENE = preload("res://scenes/bullet.tscn")
#vrum
var is_attacking = false
@onready var bullet_position = $bullet_position
@onready var shoot_cooldown = $"../shoot_cooldown"
func _physics_process(delta):
	var direction_x = Input.get_axis("move_left", "move_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	global_position.x = clamp(global_position.x , 65 , 1087)
	
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	global_position.y = clamp(global_position.y , 65 , 585)
	if Input.is_action_pressed("attack"):
		is_attacking = true
		if shoot_cooldown.is_stopped():
			shoot_bullet()
		
	else:
		is_attacking = false
	
	move_and_slide()
func shoot_bullet():
		var bullet_instance = BULLET_SCENE.instantiate()
		
		add_sibling(bullet_instance)
		bullet_instance.global_position = bullet_position.global_position
		shoot_cooldown.start()
		
	
