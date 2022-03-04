extends Control

func _on_pause_popup_close_pressed():
	self.hide()
	get_tree().paused = false



