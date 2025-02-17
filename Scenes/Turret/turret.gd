extends Node3D

@export var projectile: PackedScene
var enemy_path: Path3D
@onready var barrels: Array = [$TurretBase/TurretTop/Visor/Barrel, $TurretBase/TurretTop/Visor/Barrel2]

func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	$".".look_at(enemy.global_position, Vector3.UP, true)

func _on_reload_timeout() -> void:
	var shot = projectile.instantiate()
	shot.scale = Vector3(0.5, 0.5, 0.5)
	var random_barrel = barrels[randi() % barrels.size()]
	$".".add_child(shot)
	shot.global_position = random_barrel.global_position
	shot.direction = $".".global_transform.basis.z

	
