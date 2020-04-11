extends KinematicBody2D

const SPEED = -1000

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0,SPEED*delta))
	if collision:
		queue_free()
