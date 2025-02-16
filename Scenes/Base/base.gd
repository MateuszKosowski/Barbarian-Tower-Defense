extends Node3D

@onready var label_3d: Label3D = $Label3D
@export var max_hp: int = 3
var color_step: float = 1.0/max_hp
var color_progress: float = 0
var current_hp: int:
	set(hp_in):
		current_hp = hp_in
		label_3d.text = str(current_hp) + "/" + str(max_hp)
		if current_hp != max_hp:
			color_progress += color_step
			label_3d.modulate = Color.WHITE.lerp(Color.RED, color_progress)
		if current_hp < 1:
			get_tree().reload_current_scene()

func _ready() -> void:
	current_hp = max_hp
	
func take_damage() -> void:
	current_hp -= 1
