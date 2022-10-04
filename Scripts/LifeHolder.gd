extends Control

var life_size = 22

# Called when the node enters the scene tree for the first time.
func on_change_life(player_health):
	$Lives.rect_size.x = player_health * life_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
