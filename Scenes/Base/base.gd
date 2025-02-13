extends Node3D

@onready var label_3d: Label3D = $Label3D

@export var max_hp: int = 3
var current_hp: int:
	set(hp_in):
		current_hp = hp_in
		label_3d.text = str(current_hp)
		if current_hp < 1:
			get_tree().reload_current_scene()
		
func _ready() -> void:
	current_hp = max_hp
	
func take_damage() -> void:
	current_hp -= 1
