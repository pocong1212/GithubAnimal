extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var playerScn = preload("res://Screen/Battle_Screen/grass.tscn")
#var player
#var playerNode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setPosition(x,y):
	position = Vector2(x,y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area:
		get_parent().get_parent().get_node("Player").terrain = "grass"


func _on_Area2D_area_exited(area):
	if area:
		get_parent().get_parent().get_node("Player").terrain = "normal"
