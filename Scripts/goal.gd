extends Area2D

onready var changer = get_parent().get_node("Transition_in")

export var path : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_goal_body_entered(body: Node):
	if body.name == "Player":
		$confetti.emitting = true
		changer.change_scene(path)
		Global.checkpoint_pos = 0
