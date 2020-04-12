extends KinematicBody2D

const SPEED = -1000

func _ready():
	$ShootAudioStreamPlayer.play()
	set_physics_process(true)

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0,SPEED*delta))
	if collision:
		if collision.collider.is_in_group("enemy"):
			$DamageAudioStreamPlayer.play()
			if collision.collider.has_method("receive_damage"):
				collision.collider.receive_damage()
		queue_free()
