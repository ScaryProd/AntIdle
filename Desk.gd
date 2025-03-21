extends Node2D

var count = 0.0;
var mult = 1;
var idle = 0;
var generatingCost = 1
var antScene = preload("res://ant.tscn")


func _on_clicker_pressed() -> void:
	count += 1 * mult;
	spawn_ants(1 * mult)

func _process(delta: float) -> void:
	count = %Ants.get_child_count()
	
	%AntCount.text = str(count)
	%Clicker.text = "Click +%d" % mult 
	%IdleStatus.text = "Making %d per second" % idle
	%UpgradeStatus.text = "Making %d per click" % mult
	
	var upgradeCost = mult * 10
	%UpgradeCost.text = "Cost to upgrade clicks: %d" % upgradeCost
	$Upgrade.disabled = (count < upgradeCost);
	
	var idleCost = (idle if idle > 0 else 1) * 100
	%IdleCost.text = "Cost to upgrade idle: %d" % idleCost
	%Idle.disabled = (count < idleCost)

func _on_upgrade_pressed() -> void:
	remove_ants(mult * 10)
	mult += 1;

func _on_idle_pressed() -> void:
	spendMoney((idle if idle > 0 else 1) * 100)
	idle += 1

func spendMoney(cost) -> void:
	remove_ants(cost)
	
func idleProcess() -> void:
	spawn_ants(idle)

func _on_timer_timeout() -> void:
	idleProcess()

func spawn_ants(amount: int) -> void:
	for i in amount:
		var newAnt = antScene.instantiate()
		%Ants.add_child(newAnt);

func remove_ants(amount: int) -> void:
	for i in amount:
		%Ants.remove_child(%Ants.get_children()[0]);
