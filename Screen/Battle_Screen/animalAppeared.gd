extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var playerScn = preload("res://Screen/Battle_Screen/Player")

var jawaban
var materials = 1
var player
signal playerMove

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	position.x = ((get_viewport().size.x/ 2) - 150)
	position.y = get_viewport().size.y/ 2 - 150
	set_as_toplevel(true)

func setQuestion(qst,listJwb):
	show()
	get_node("Label").text = qst
	get_node("Button").text = listJwb[0]
	get_node("Button2").text = listJwb[1]
	get_node("Button3").text = listJwb[2]
	get_node("Button4").text = listJwb[3]
	jawaban = listJwb[listJwb[4]]
	
	if materials == 0:
		get_node("Button").disabled = true
		get_node("Button2").disabled = true
		get_node("Button3").disabled = true
		get_node("Button4").disabled = true
	else:
		get_node("Button").disabled = false
		get_node("Button2").disabled = false
		get_node("Button3").disabled = false
		get_node("Button4").disabled = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if get_node("Button").text == jawaban:
		print("true")
	else:
		print("false")


func _on_Button2_pressed():
	if get_node("Button2").text == jawaban:
		print("true")
	else:
		hide()
		emit_signal("playerMove")
		print("false")


func _on_Button3_pressed():
	if get_node("Button3").text == jawaban:
		print("true")
	else:
		hide()
		emit_signal("playerMove")
		print("false")


func _on_Button4_pressed():
	if get_node("Button4").text == jawaban:
		print("true")
	else:
		hide()
		emit_signal("playerMove")
		print("false")


func _on_Button5_pressed():
	hide()
	emit_signal("playerMove")
