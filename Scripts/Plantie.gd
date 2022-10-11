extends KinematicBody2D

var facing_left = false
var hitted = false
export var health = 3

onready var bullet_instance = preload("res://Scenes/Seed.tscn")
#onready var player = Global.get("player")
onready var player = Global.get("player") # line 6


func _physics_process(_delta: float) -> void:
	
	_set_animation()
#	var player = Global.get("player") # line 6
	
	if player:
		var distance = player.global_position.x - self.position.x
		facing_left = true if distance < 0 else false
		
	if facing_left:
		self.scale.x = 1
	else:
		self.scale.x = -1

func _set_animation():
	var anim = "idle"
	
	if $player_detector.overlaps_body(player):
		anim = "attack"
#	else:
#		anim = ""
	if hitted == true:
		anim = "hit"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func shoot():
	var bullet = bullet_instance.instance()
	get_parent().add_child(bullet)
	bullet.global_position = $spawn_shoot.global_position
	
	if facing_left:
		bullet.direction = 1
	else:
		bullet.direction = -1
#
#func _on_player_detector_body_entered(_body):
#	$anim.play("attack")
#
#func _on_player_detector_body_exited(_body):
#	$anim.play("idle")

func _on_hitbox_body_entered(body):
	hitted = true
	health -= 1
	body.velocity.y = body.jump_force / 2
	$hitFx.play()
	yield(get_tree().create_timer(.2), "timeout")
	hitted = false
	if health < 1:
		get_node("hitbox/collision").set_deferred("disabled", true)
		queue_free()
