extends Node

@onready var p_1: CharacterBody3D = $"../p1"
@onready var p_2: CharacterBody3D = $"../p2"
@onready var camera_3d: Camera3D = $Camera3D
const ofset_cam:Vector3 = Vector3(0,10,12)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var target_pos = mid_player(p_1,p_2)
	camera_3d.position = target_pos+ofset_cam
	camera_3d.look_at(target_pos,Vector3.UP)
func mid_player(p1:CharacterBody3D,p2:CharacterBody3D):
	return Vector3((p1.global_position+p2.global_position)/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_pos = mid_player(p_1,p_2)+ofset_cam
	camera_3d.global_position = camera_3d.global_position.lerp(target_pos,5.0*delta)
	
	
