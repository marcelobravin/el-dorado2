extends KinematicBody2D

export var speed = 64
export var health = 1
var velocity = Vector2.ZERO
var move_direction = -1
var gravity = 1200
var hitted = false
#onready var hurtbox_col = get_node("hurtbox/CollisionShape2D")

func _physics_process(delta: float) -> void:
	velocity.x = speed * move_direction
	velocity.y += gravity * delta
	
	if move_direction == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	
	_set_animation()
	
	velocity = move_and_slide(velocity)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "idle":
#		$Sprite.flip_h != $Sprite.flip_h
		$RayCast2D.scale.x *= -1
		move_direction *= -1
		$AnimationPlayer.play("run")
#	elif anim_name == "hit":
#		hitted = false

func _on_hitbox_body_entered(body):
	hitted = true
	health -= 1
	body.velocity.y -= 300
	yield( get_tree().create_timer(.2), "timeout" )
	hitted = false
	
	if health < 1:
		queue_free()
		get_node("hitbox/collision").set_deferred("disabled", true)

func _set_animation():
	var anim = "run"
	
	if $RayCast2D.is_colliding():
		anim = "idle"
	elif velocity.x != 0:
		anim = "run"
	
	if hitted:
		anim = "hit"
	
	if $AnimationPlayer.assigned_animation != anim:
		$AnimationPlayer.play(anim)
