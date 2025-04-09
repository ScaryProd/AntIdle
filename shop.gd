extends Node2D

var insect_dict = {'black_ant': "res://insects/nav_ant.tscn", 'white_ant': "res://insects/phys_ant.tscn"}

func _ready() -> void:
	for insect in insect_dict:
		print(insect)
	make_test_shop()


func make_test_shop() -> void:
	for this_button in range(1, 30):
		var button_object: Button = Button.new()
		button_object.icon = load("res://assets/sprites/ant.png")
		button_object.pressed.connect(_on_buy_new_ant.bind(this_button))
		$GridContainer.add_child(button_object)


func _on_buy_new_ant(this_ant: int) -> void:
	$BuyPreview/BuyImage.texture = load("res://assets/sprites/ant_white.png")
	$BuyPreview/Name.text = "Buy Ant %s" % this_ant
	$BuyPreview/Buy.disabled = false
