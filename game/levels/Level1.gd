extends Node2D

const SCROLL_SPEED = 500

var lives = 3

func _ready():
	set_physics_process(true)
	set_process(true)

func _physics_process(delta):
	pass

func _process(delta):
	#background image management
	for bg in [$Background/Background1,$Background/Background2,$Background/Background3]:
		if bg.position.y>=1560:
			bg.position.y -= 3840
		else:
			bg.position.y += SCROLL_SPEED*delta
	update_heart_UI()

func update_heart_UI():
	$Hearts/Heart_01.visible = (lives>=1)
	$Hearts/Heart_02.visible = (lives>=2)
	$Hearts/Heart_03.visible = (lives>=3)
