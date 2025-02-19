extends PathFollow3D

@export var speed: float = 5.0
@export var max_hp: int = 50
@export var gold_value := 15

var curr_hp: int:
	set(health_in):
		if health_in < curr_hp:
			animation_player.play("TakeDmg")
		curr_hp = health_in
		if curr_hp < 1:
			queue_free()
			bank.gold += gold_value
		
@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("bank")

func _ready() -> void:
	curr_hp = max_hp
	#Engine.time_scale = 3

func _process(delta: float) -> void:
	$".".progress += (delta * speed)
	if($".".progress_ratio == 1):
		base.take_damage()
		set_process(false)
		queue_free()
