extends KinematicBody2D

const SPEED = 600;
onready var timer = $Timer
onready var area = $Area2D

var health = 3

func _ready():
	set_physics_process(false)
	timer.connect("timeout",self,"walk")
	area.connect("body_entered",self,"hit")

func _physics_process(delta):
	move_and_collide(Vector2(0,SPEED*delta));

func walk():
	set_physics_process(true)

func hit(body):
	if body.is_in_group("player"):
		$AudioStreamPlayer.play()
		print("você perdeu uma vida, agora tem "+String(body.lives))
		queue_free()
	elif body.is_in_group("bottom_wall"):
		queue_free()
		print("saiu")

func receive_damage():
	$DamageAnimationPlayer.play("damage")
	health -= 1
	if health == 0:
		queue_free()

