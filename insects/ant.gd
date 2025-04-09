extends Node2D

func _ready() -> void:
	$Timer.wait_time = randf_range(0.5,1.5)

func _on_timer_timeout() -> void:
	var randomDirection = randi_range(0,1);
	if randomDirection == 0:
		randomDirection = -1
		$AntRigidBody/AntSprite.flip_h = false
	else:
		$AntRigidBody/AntSprite.flip_h = true
	
	$AntRigidBody.apply_central_impulse(Vector2(randomDirection*1000,randi_range(1500,2500)))

func _process(delta: float) -> void:
	pass
