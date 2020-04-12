extends KinematicBody2D

var speed = 0;
onready var timer = $Timer
onready var area = $Area2D
var lixo

var health = 3

func _ready():
	add_to_group("enemy")
	set_physics_process(false)
	timer.connect("timeout",self,"anda")
	area.connect("body_entered",self,"pegou")
	pass # Replace with function body.

func _physics_process(delta):
	lixo = move_and_collide(Vector2(0,speed*delta));
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func anda():
	set_physics_process(true)
	pass

func pegou(body):
	if body.is_in_group("player"):
		body.lives -= 1
		$AudioStreamPlayer.play()
		print("você perdeu uma vida, agora tem "+String(body.lives))
		queue_free()
		pass
	elif body.is_in_group("bottom_wall"):
		queue_free()
		print("saiu")
		pass
	pass

func receive_damage():
	health -= 1
	if health == 0:
		queue_free()

