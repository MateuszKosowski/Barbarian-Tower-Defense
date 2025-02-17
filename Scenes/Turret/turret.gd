extends Node3D

@export var projectile: PackedScene

@onready var barrels: Array = [$TurretBase/TurretTop/Visor/Barrel, $TurretBase/TurretTop/Visor/Barrel2]

func _on_reload_timeout() -> void:
	var shot = projectile.instantiate()
	shot.scale = Vector3(0.5, 0.5, 0.5)
	var random_barrel = barrels[randi() % barrels.size()]
	$".".add_child(shot)
	shot.global_position = random_barrel.global_position
	print($".".global_position)
	print(random_barrel.global_position)
	
