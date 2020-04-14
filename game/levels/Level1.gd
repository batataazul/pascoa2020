extends Node2D

const SCROLL_SPEED = 500
const SPAWN_SPEED = 1.2
var lives = 3
var time_last_spawn = 0
var spider_scene

onready var rabbit = $Rabbit

func _ready():
	spider_scene = load("res://enemies/Spider.tscn")
	set_physics_process(true)
	set_process(true)

func _physics_process(delta):
	time_last_spawn += delta
	if time_last_spawn >= SPAWN_SPEED:
		time_last_spawn -= SPAWN_SPEED
		spawn_spider()

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

func spawn_spider():
	var new_spider = spider_scene.instance()
	match randi()%5:
		0:
			$SpawnPoints/Point_0.add_child(new_spider)
		1:
			$SpawnPoints/Point_1.add_child(new_spider)
		2:
			$SpawnPoints/Point_2.add_child(new_spider)
		3:
			$SpawnPoints/Point_3.add_child(new_spider)
		4:
			$SpawnPoints/Point_4.add_child(new_spider)
