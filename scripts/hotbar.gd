extends Control

var selected_slot : int = 0
var build_system

func _ready() -> void:
	build_system = get_tree().get_first_node_in_group("BuildSystem")
func _process(delta: float) -> void:
	if selected_slot == 1:
		build_system.selected_tile = Vector2i(0,2)
		print("Is trying to switch")
func _on_texture_button_button_down() -> void:
	selected_slot = 0
	

func _on_texture_button_2_button_down() -> void:
	selected_slot = 1
	print("should switch tile")

func _on_texture_button_3_button_down() -> void:
	selected_slot = 2

func _on_texture_button_4_button_down() -> void:
	selected_slot = 3

func _on_texture_button_5_button_down() -> void:
	selected_slot = 4


func _on_texture_button_6_button_down() -> void:
	selected_slot = 5

func _on_texture_button_7_button_down() -> void:
	selected_slot = 6

func _on_texture_button_8_button_down() -> void:
	selected_slot = 7
