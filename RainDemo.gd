extends Node3D

@export_category("Particles")
@export var _real_rain:Node
@export var _cartoon_rain:Node
@export var _personal_real_rain:Node
@export var _personal_cartoon_rain:Node
@export var _env_rain:Node
@export var _personal_rain:Node

@export_category("Buttons")
@export var _player_on:Node
@export var _player_off:Node
@export var _env_on:Node
@export var _env_off:Node
@export var _cartoon_rain_button:Node
@export var _real_rain_button:Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouse_mode_toggle"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED



func _on_player_rain_on_button_pressed():
	_personal_rain.show()
	_player_on.hide()
	_player_off.show()


func _on_player_rain_off_button_pressed():
	_personal_rain.hide()
	_player_on.show()
	_player_off.hide()


func _on_rain_on_pressed():
	_env_rain.show()
	_env_on.hide()
	_env_off.show()


func _on_rain_off_pressed():
	_env_rain.hide()
	_env_on.show()
	_env_off.hide()


func _on_cartoon_rain_button_pressed():
	_cartoon_rain.show()
	_real_rain.hide()
	_personal_cartoon_rain.show()
	_personal_real_rain.hide()
	_cartoon_rain_button.hide()
	_real_rain_button.show()


func _on_real_rain_button_pressed():
	_cartoon_rain.hide()
	_real_rain.show()
	_personal_cartoon_rain.hide()
	_personal_real_rain.show()
	_cartoon_rain_button.show()
	_real_rain_button.hide()
