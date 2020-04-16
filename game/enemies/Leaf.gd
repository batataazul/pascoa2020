extends KinematicBody2D

const SPEED = 300

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0,SPEED*delta))
	if collision:
		if collision.collider.is_in_group("enemy"):
			if collision.collider.has_method("receive_damage"):
				collision.collider.receive_damage()
		queue_free()
