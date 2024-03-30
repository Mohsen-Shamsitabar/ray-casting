extends Node2D
class_name MouseCursor

const RayClass = preload ("res://ray.tscn")

@onready var mouse_cursor: Node2D = get_node(".")

const MAX_DEGREE: int = 360
var ray_count: int = 360
var step: int = MAX_DEGREE / ray_count

func _ready():

	for degree in range(0, 360, step):
		var ray: Ray = RayClass.instantiate()
		ray.global_position = mouse_cursor.global_position
		ray.global_rotation_degrees = degree

		mouse_cursor.add_child(ray)

func handle_mouse_movement():
	mouse_cursor.global_position = get_global_mouse_position()

func _process(_delta):
	handle_mouse_movement()
