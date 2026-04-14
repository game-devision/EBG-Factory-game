extends Panel




func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

var data_bk

func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_bk = get_viewport().gui_get_drag_data()
	if what == Node.NOTIFICATION_DRAG_END:
		if not is_drag_successful():
			get_viewport().gui_get_drag_data()
			if data_bk:
				data_bk.icon.show()
				data_bk = null
