extends Node3D
var P1:bool = false
var P2:bool = false
var player_in_area:Array 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func Check(P:String,value:bool):
	
	if P == "p1":
		P1 = value
	if P == "p2":
		P2 = value
	if P1 and P2:
		$Map/CSGBox3D4.visible = false
		$Map/CSGBox3D4.use_collision = false
	#else :
		#$Map/CSGBox3D4.visible = true
		#$Map/CSGBox3D4.use_collision = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_plate_a_body_entered(body: Node3D) -> void:
	if body is not CharacterBody3D:return
	Check("p1",true)




func _on_plate_a_body_exited(body: Node3D) -> void:
	if body is not CharacterBody3D:return
	Check("p1",false)


func _on_plate_b_body_exited(body: Node3D) -> void:
	if body is not CharacterBody3D:return
	Check("p2",false)


func _on_plate_b_body_entered(body: Node3D) -> void:
	if body is not CharacterBody3D:return
	Check("p2",true)


func _on_goal_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D and (body.name == "p1" or body.name == "p2"):
		player_in_area.append(body)
		print(player_in_area)
		if player_in_area.size() == 2:
			get_tree().paused = true
			$CanvasLayer/Panel.visible = true



func _on_goal_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D and (body.name == "p1" or body.name == "p2"):
		player_in_area.erase(body)
		print(player_in_area)






func _on_goal_area_entered(area: Area3D) -> void:
	print(area)


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
