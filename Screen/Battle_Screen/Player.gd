extends KinematicBody2D

export var speed = 0.47
export var tileSize = 2

onready var sprite = $Area2D/Sprite
onready var animalScn = preload("res://Screen/Battle_Screen/animalAppeared.tscn")

var initpos = Vector2()
var dir = Vector2()
var facing = "down"
var counter = 0.0
var moving = false
var terrain = "normal"
var collision = CollisionShape2D
var rnd = RandomNumberGenerator.new()
var animal
var animalNode
var openQuest = false

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
		x = int(Input.is_key_pressed(KEY_D)) - int(Input.is_key_pressed(KEY_A))
	if dir.x == 0:
		y = int(Input.is_key_pressed(KEY_S)) - int(Input.is_key_pressed(KEY_W))
	
	return Vector2(x , y)

func move(delta): # move the player linearly
	
	counter += delta + speed
	
	if openQuest == false:
	
		if counter >= 1.0:
			position = initpos + dir * tileSize
			counter = 0.0
			moving = false
		else:
			position = initpos + dir * tileSize * counter
	
	if terrain == "grass":
		rnd.randomize()
		var random_number = rnd.randi_range(0,30)
		if random_number == 5:
			print("masuk scene battle")
			rnd.randomize()
			var random_animal = rnd.randi_range(1,10)
			if random_animal < 7:
				openQuest = true
				print("Kuda Liar")
				animal = animalScn.instance()
				add_child(animal)
			elif random_animal < 9:
				print("Babi Hutan")
			elif random_animal <= 10:
				print("Rusa Hutan")
			
			
	

func checkTerrain():
	pass
