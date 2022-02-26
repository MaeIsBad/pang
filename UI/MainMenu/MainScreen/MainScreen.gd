extends CenterContainer

# The signals are called directly from the button

# warning-ignore:unused_signal
signal start_pressed
# warning-ignore:unused_signal
signal options_pressed

func on_exit_button_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
