extends Node2D

var status = "normal"
onready var grassScn = preload("res://Screen/Battle_Screen/grass.tscn")
var grass
var grassNode
var grassPosition = []
var terrain = "normal"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if grassPosition.size() > 0:
		for i in range(grassPosition.size()):
			grass = grassScn.instance()
			grassNode = grass.get_node("grass")
			grassNode.setPosition(grassPosition[i][0]*10,grassPosition[i][1]*10)
			add_child(grass)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
