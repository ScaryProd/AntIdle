extends Node2D
#extends CharacterBody2D

@onready var path: Path2D = $Path2D
@onready var path_follow: PathFollow2D = $Path2D/AntPath

@export var move_speed: float = 600.0;
@export var loop_path: bool = false;


func _ready() -> void:
	path_follow.loop = loop_path;
	
	#$Sprite2D.position = path_follow.global_position
	#last_position = position
	
func _physics_process(delta: float) -> void:

	path_follow.progress += move_speed * delta
	$CharacterBody2D.position = path_follow.global_position
	#print($CharacterBody2D.body_entered)


func _on_character_body_2d_body_entered(body: Node) -> void:
	print('something entered!')
