extends KinematicBody2D

onready var anim = $anim
onready var timer = $timer
onready var reset_position = global_position

var velocity = Vector2.ZERO
var gravity = 720
var is_triggered = false
export var reset_timer = 3


func _ready():
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta

func collide_with(collision: KinematicCollision2D, collider: KinematicBody2D):
	if !is_triggered:
		is_triggered = true
		velocity = Vector2.ZERO
