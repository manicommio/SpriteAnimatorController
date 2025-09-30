extends CharacterBody3D


@onready var map_RID:RID = get_world_3d().get_navigation_map()
@onready var collision_shape = $CollisionShape3D
@onready var state_machine = $StateMachine
@onready var animator = $AnimatorController
@onready var ray_cast_ground = $RayCast_ground
#________________________________
@export var torque_max := 45.0
@export var health = 500.0
@export var current_health = 500.0
var pain_healt := 500.0

const SPEED = 3.0
const JUMP_VELOCITY = 4.5
#___________________________________
var direction_rotation := Vector3()
var torque := 0.0
var move_dir := 0.0
var state = ""
#__________________________________
var path := []
var target_position := Vector3()
var target_direction := Vector3()
var destination := Vector3()
#___________________________________
var FLIP := false


func _ready() ->void:
	direction_rotation = self.global_basis.z.normalized()
	randomize()
	FLIP = randi()%2


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 3 * delta

	var direction = global_transform.basis.z.normalized()  * move_dir
	if direction :
		velocity.x = direction.x * SPEED 
		velocity.z = direction.z * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	#_____________________________
	ClimbStep()
	#______________________________
	NavigationProces()


func ClimbStep() ->void:
	var step_height :float = 0.6
	var collision_data = get_last_slide_collision()
	if collision_data:
		var collision_point = collision_data.get_position()
		if get_floor_normal() == Vector3.UP and is_on_floor():
			if collision_point.y > self.global_position.y + 0.05 and collision_point.y <= self.global_position.y + step_height:
				self.global_position.y += step_height


func _process(_delta:float) ->void:
	if state_machine .current_state != null:
		state = state_machine .current_state.get_name()
	#______________________________________________
	if animator.current_clip != null:
		animator.current_clip.FLIP = FLIP
	#______________________________________________
	if state != "death":
		if current_health <= 0:
			state_machine.ChangeState("death")
		elif pain_healt >= current_health + 10:
			pain_healt = current_health
			state_machine.ChangeState("pain")
			
		
func Damage(_damage:float, _bullet:Node3D, _bullet_force:float, _shot_type:String, _shape:int) ->void:
	if state != "death" :
		current_health -= _damage


func RotateEnemy(delta:float) ->void:
	direction_rotation = target_direction
	#_______________________________________________________________________________________________
	torque = lerp_angle(torque, atan2(direction_rotation.x, direction_rotation.z) - rotation.y, delta * 10)
	torque = clamp(torque, -deg_to_rad(torque_max) , deg_to_rad(torque_max))
	if is_on_floor():
		transform.basis = transform.basis.rotated(Vector3.UP, (torque * 5) * delta)


func NavigationPath() ->void:
	var safe_goal: Vector3 = NavigationServer3D.map_get_closest_point(map_RID, destination)
	path = NavigationServer3D.map_get_path(map_RID, global_position, safe_goal, true) 
	 
	
func NavigationProces() ->void:
	if path.size() >0:
		target_direction = self.global_transform.origin.direction_to(path[0])
		if ray_cast_ground .is_colliding():
			var dist = ray_cast_ground .get_collision_point().distance_to(path[0])
			if dist <= 1.3 :
				path.remove_at(0)
		else:
			var dist = self.global_transform.origin.distance_to(path[0])
			if dist <= 1.3 :
				path.remove_at(0)
