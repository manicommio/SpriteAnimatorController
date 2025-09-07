extends MeshInstance3D
class_name MeshProyector3D


@export var animator :AnimatorController = null
@onready var material := StandardMaterial3D.new()
var texture_color := Color(1,1,1,1)
var billboard_disabled : bool = false
var billboard_Y : bool = false


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
		if animator.current_clip != null:
			texture_color = animator.current_clip.texture_color
			billboard_disabled = animator.current_clip.billboard_disabled
			billboard_Y = animator.current_clip.bBillboard_Y
			
			if !billboard_disabled:
				if billboard_Y:
					material.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
				else: 
					material.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
			else:
				material.billboard_mode = BaseMaterial3D.BILLBOARD_DISABLED
			
			material.billboard_keep_scale = true
			var uv_escala = animator.current_clip.size
			var off_set = animator.current_clip.offset
			material.albedo_color = texture_color
			material.albedo_texture =  animator.current_clip.GetSpriteSheet()
			material.set("uv1_scale", Vector3(uv_escala.x ,uv_escala.y,0))
			material.set("uv1_offset", Vector3(off_set.x, off_set.y,0))
