extends KinematicBody2D

const SPEED = 300
var carrot_node
var collision
var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	carrot_node = load("res://player/Carrot.tscn")
	set_physics_process(true)
	add_to_group("player")

func _physics_process(delta):
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
	collision = move_and_collide(SPEED*velocity.normalized()*delta)
	if Input.is_action_just_pressed("ui_accept"):
		var new_carrot = carrot_node.instance()
		new_carrot.global_position = self.global_position + Vector2(0,-150)
		get_parent().add_child(new_carrot)
	if collision:
		if collision.collider.is_in_group("enemy"):
			lives -= 1
			$DamageRabbitAudioStreamPlayer.play()
	if lives <= 0:
		print("Você morreu :(")
		queue_free()
