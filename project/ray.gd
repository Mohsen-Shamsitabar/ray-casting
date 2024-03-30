extends RayCast2D
class_name Ray

@onready var ray: RayCast2D = get_node(".")
@onready var line: Line2D = get_node("Line")

var length: float = 1200
var direction: Vector2 = Vector2(1, 0)

func _ready():
	ray.target_position = direction * length
	line.add_point(ray.position)

func handle_collision():

	line.clear_points()
	var collision_pos: Vector2 = ray.target_position

	if (ray.is_colliding()):
		collision_pos = ray.to_local(ray.get_collision_point())

	line.add_point(ray.position)
	line.add_point(collision_pos)

func _process(_delta):
	handle_collision()
