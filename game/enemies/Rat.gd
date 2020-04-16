extends KinematicBody2D

const SPEED = 200;
onready var timer = $Timer
onready var area = $Area2D

var health = 3
var leaf_scene

func _ready():
	leaf_scene = load("res://enemies/Leaf.tscn")
	area.connect("body_entered",self,"hit")
	timer.connect("timeout",self,"shoot")
	set_physics_process(true)

func _physics_process(delta):
	move_and_collide(Vector2(0,SPEED*delta));

func shoot():
	var new_leaf = leaf_scene.instance()
	new_leaf.position = Vector2(0,125)
	add_child(new_leaf)

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
