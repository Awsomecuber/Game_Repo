extends Node2D

var connection_thread := Thread.new()
var connection_complete := false
var wiimote: GDWiimote
@onready var cursor: Sprite2D = $Sprite2D
var _is_calibrated = true
@export var SPEED: float = 500.


func _ready() -> void:
	connection_thread.start(Callable(self, "_thread_connect_wiimotes"))
	
func _process(delta: float) -> void:
	if wiimote == null:
		return
	var acc = wiimote.get_accel()
	cursor.global_position.x -= acc.y * delta * SPEED
	cursor.global_position.y -= acc.x * delta * SPEED

func _thread_connect_wiimotes():
	GDWiimoteServer.initialize_connection(false)
	call_deferred("_on_connection_complete")

func _on_connection_complete():
	GDWiimoteServer.finalize_connection()
	init()

func init() -> void:
	var wiimotes = GDWiimoteServer.get_connected_wiimotes()
	if wiimotes.is_empty():
		push_error("No Wiimote connected!")
		return
	wiimote = wiimotes[0]
	wiimote.set_motion_sensing(true)
	cursor.show()
	cursor.global_position = get_viewport().get_visible_rect().size / 2
	
func calibrate():
	_is_calibrated = false
	
