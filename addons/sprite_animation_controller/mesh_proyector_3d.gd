extends MeshInstance3D
class_name MeshProyector3D


@export var animator :AnimatorController = null
@onready var material := StandardMaterial3D.new()
var billboard_disabled : bool = false
var billboard_Y : bool = false
var uv_escala := Vector2()
var off_set := Vector2()


func _ready() ->void:
	#self.hide()
	#material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	#material.alpha_scissor_threshold = 0.5
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	#material.params_cull_mode = StandardMaterial3D.CULL_DISABLED
	#material.params_billboard_mode = StandardMaterial3D.BILLBOARD_FIXED_Y
	material.billboard_keep_scale = true
	material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	self.material_override = material
	

func _process(_delta: float) ->void:
	if is_instance_valid(animator) and animator != null:
		if animator != null:
			if billboard_disabled != animator.billboard_disabled:
				billboard_disabled = animator.billboard_disabled
			if billboard_Y != animator.billboard_Y:
				billboard_Y = animator.billboard_Y
			
			if !billboard_disabled:
				if billboard_Y:
					if material.billboard_mode != BaseMaterial3D.BILLBOARD_FIXED_Y:
						material.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
				else: 
					if material.billboard_mode != BaseMaterial3D.BILLBOARD_ENABLED:
						material.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
			else:
				if material.billboard_mode != BaseMaterial3D.BILLBOARD_DISABLED:
					material.billboard_mode = BaseMaterial3D.BILLBOARD_DISABLED
			
			if material.billboard_keep_scale != true:
				material.billboard_keep_scale = true
			if uv_escala != animator.size:
				uv_escala = animator.size
			if off_set != animator.offset:
				off_set = animator.offset

			if material.albedo_texture != animator.spritesheet:
				material.albedo_texture = animator.spritesheet
			if material.get("uv1_scale") != Vector3(uv_escala.x ,uv_escala.y,0):
				material.set("uv1_scale", Vector3(uv_escala.x ,uv_escala.y,0))
			if material.get("uv1_offset") != Vector3(off_set.x, off_set.y,0):
				material.set("uv1_offset", Vector3(off_set.x, off_set.y,0))
