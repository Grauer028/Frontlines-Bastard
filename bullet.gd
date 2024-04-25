extends Area2D

var bullet_speed := -900


func _process(delta):
	position.y += bullet_speed * delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

