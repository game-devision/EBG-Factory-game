extends Node2D

@onready var ground: TileMapLayer = $Ground
@onready var preview: TileMapLayer = $Preview

var source_id : int
var selected_tile : Vector2i

var select_mode : bool = false
var preview_tile : Vector2i:
	set(value):
		if preview_tile == value:
			return
			
		preview.erase_cell(preview_tile)
		preview_tile = value
		preview.set_cell(value, source_id, selected_tile)
		
		var atlas_tile : TileSetAtlasSource
		atlas_tile = preview.tile_set.get_source(source_id)
		var tile_size
		if atlas_tile:
			tile_size = atlas_tile.get_tile_size_in_atlas(selected_tile)
			print(tile_size)
		placeable = true
		for i in range(tile_size.y):
			for j in range(tile_size.x):
				var tile = preview_tile + Vector2i(i,j)
				if tile in BuildingManager.used_tiles:
					placeable = false
			
		
var placeable : bool = true:
	set(value):
		placeable = value
		if value == false:
			preview.modulate = Color.RED
		else:
			preview.modulate = Color.WHITE

func get_snapped_position(global_pos: Vector2) -> Vector2i:
	var local_pos = ground.to_local(global_pos)
	var tile_pos = ground.local_to_map(local_pos)
	
	return tile_pos

func _physics_process(delta: float) -> void:
	preview_tile = get_snapped_position(get_global_mouse_position())
	if Input.is_action_just_pressed("Place") and placeable:
		print("tried to place")
		source_id = 0
		place_tile(preview_tile, selected_tile)
	if Input.is_action_just_pressed("Destroy") and placeable:
		print("tried to other")
		place_tile(preview_tile, Vector2i(0,0))
		
	return
# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_1 and event.pressed:
			print("select mode")
			select_mode = true
			source_id = 0
			selected_tile = Vector2i(0,1)
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and select_mode:
			print("tried to place")
			place_tile(preview_tile, Vector2i(0,0))
			select_mode = false
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			return
			#ground.erase_cell(preview_tile)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func place_tile(tile_pos: Vector2i, select_tile: Vector2i):
	ground.set_cell(tile_pos, source_id, select_tile)
	preview.erase_cell(tile_pos)
	BuildingManager.get_tiles(ground, selected_tile, preview_tile)
