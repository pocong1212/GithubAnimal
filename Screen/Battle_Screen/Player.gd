extends KinematicBody2D

export var speed = 1.0
export var tileSize = 2.0

onready var sprite = $Sprite

var initpos = Vector2()
var dir = Vector2()
var facing = "down"
var counter = 0.0

var moving = false

func _ready():
	initpos = position
	
func _process(delta):
	
	if not moving:
		#set dir
		set_dir()
	elif dir != Vector2():
		#move
		move(delta)
	else:
		moving = false
		
	if facing == "down":
		sprite.frame = 1
	elif facing == "up":
		sprite.frame = 10
	elif facing == "right":
		sprite.frame = 4
	elif facing == "left":
		sprite.frame = 7
		
		

func set_dir(): #set moving
	dir = get_dir()
	
	if dir.x != 0 or dir.y != 0:
		
		if dir.x > 0:
			facing = "right"
		elif dir.x < 0:
			facing = "left"
		elif dir.y > 0:
			facing = "down"
		else:
			facing = "up"
		
		moving = true
		initpos = position

func get_dir(): #user input
	
	var x = 0
	var y = 0
	
	if dir.y == 0:
		x = int(Input.is_action_pressed("ui_right"))- int(Input.is_action_pressed("ui_left"))
	if dir.x == 0:
		y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	return Vector2(x , y)

func move(delta): # move the player linearly
	
	counter += delta + speed
	
	if counter >= 1.0:
		position = initpos + dir * tileSize
		counter = 0.0
		moving = false
	else:
		position = initpos + dir * tileSize * counter
