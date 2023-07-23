extends CharacterBody3D

var move_input:Vector2
var mouseSensibility = 1200
var mouse_relative_x = 0
var mouse_relative_y = 0

const SPEED = 5.0

@onready var HEAD = $Head

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Handle look controls


func _physics_process(delta):
	# Move player based on input.
	var input_dir = Input.get_vector("strafe_left", "strafe_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 1)
		velocity.z = move_toward(velocity.z, 0, 1)
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation.y -= event.relative.x / mouseSensibility
		HEAD.rotation.x -= event.relative.y / mouseSensibility
		HEAD.rotation.x = clamp(HEAD.rotation.x, -PI/2 , PI/2)
		mouse_relative_x = clamp(event.relative.x, -50, 50)
		mouse_relative_y = clamp(event.relative.y, -50, 10)
		
