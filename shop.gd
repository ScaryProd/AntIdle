extends Node2D

var insect_dict = {'black_ant': "res://insects/nav_ant.tscn", 'white_ant': "res://insects/phys_ant.tscn"}

func _ready() -> void:
	for insect in insect_dict:
		print(insect)
