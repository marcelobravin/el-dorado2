extends KinematicBody2D

var facing_left = false

onready var bullet_instance = preload("res://Scenes/seed.tscn")
#onready var player = Global.get("player")

func _physics_process(_delta: float) -> void:
	var player = Global.get("player") # line 6
	
	if player:
		var distance = player.global_position.x - self.position.x
		facing_left = true if distance < 0 else false
		
	if facing_left:
		self.scale.x = 1
	else:
		self.scale.x = -1

func shoot():
	var bullet = bullet_instance.instance()
	add_child(bullet)
	bullet.global_position = $spawn_shoot.global_position

func _on_player_detector_body_entered(_body):
	$anim.play("attack")

func _on_player_detector_body_exited(_body):
	$anim.play("idle")
