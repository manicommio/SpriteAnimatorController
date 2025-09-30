extends CollisionShape2D


var player :Node2D = null

func _ready():
	var miPlayer = get_tree().get_nodes_in_group("player")
	if miPlayer.size()>0:
		player = miPlayer[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.global_position.y < self.global_position.y:
		self.disabled = false
	else:
		self.disabled = true
