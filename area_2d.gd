extends Area2D


func _ready():
	pass 
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("bullets"):
		area.queue_free()
		owner.queue_free()
