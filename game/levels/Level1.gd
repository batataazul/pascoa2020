extends Node2D

const SCROLL_SPEED = 500
const SPAWN_SPEED = 1.2
var lives = 3
var time_last_spawn = 0
var spider_scene
var rat_scene

onready var rabbit = $Rabbit

func _ready():
	spider_scene = load("res://enemies/Spider.tscn")
	rat_scene = load("res://enemies/Rat.tscn")
	$PauseUI/PauseButton.connect("button_down",self,"pause_button_down")
	$LevelEndTimer.connect("timeout",self,"level_end_timeout")
	set_physics_process(true)
	set_process(true)

func _physics_process(delta):
	time_last_spawn += delta
	if time_last_spawn >= SPAWN_SPEED:
		time_last_spawn -= SPAWN_SPEED
		spawn_enemy()

func _process(delta):
	#background image management
	for bg in [$Background/Background1,$Background/Background2,$Background/Background3]:
		if bg.position.y>=1560:
			bg.position.y -= 3840
		bg.position.y += SCROLL_SPEED*delta
	lives = rabbit.lives
	update_heart_UI()

func update_heart_UI():
	$Hearts/Heart_01.visible = (lives>=1)
	$Hearts/Heart_02.visible = (lives>=2)
	$Hearts/Heart_03.visible = (lives>=3)

func spawn_enemy():
	var enemy
	if randi()%4 >1:
		enemy = spider_scene.instance()
	else:
		enemy = rat_scene.instance()
	var location_x = randf()*700 +10
	enemy.position = Vector2(location_x,75)
	$Enemies.add_child(enemy)

func level_end_timeout():
	pass
	#go to next level
