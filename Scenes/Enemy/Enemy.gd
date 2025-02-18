extends PathFollow3D

@export var speed: float = 5.0
@export var max_hp: int = 50

var curr_hp: int:
	set(health_in):
		curr_hp = health_in
		if curr_hp < 1:
			queue_free()
		
@onready var base = get_tree().get_first_node_in_group("base")

func _ready() -> void:
	curr_hp = max_hp

func _process(delta: float) -> void:
	$".".progress += (delta * speed)
	if($".".progress_ratio == 1):
		base.take_damage()
		set_process(false)
