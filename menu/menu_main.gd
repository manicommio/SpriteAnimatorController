extends Control

@onready var tb_1 = $TB1
@onready var tb_2 = $TB2
@onready var tb_3 = $TB3

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.current_scene = self
	tb_1.connect("pressed", ExampleIsometric)
	tb_2.connect("pressed", ExamplePlatform)
	tb_3.connect("pressed", ExampleDoom)

func ExampleIsometric():
	GameManager.number_scene = 1
	GameManager.goto_scene("res://menu/preload.tscn")

func ExamplePlatform():
	GameManager.number_scene = 2
	GameManager.goto_scene("res://menu/preload.tscn")

func ExampleDoom():
	GameManager.number_scene = 3
	GameManager.goto_scene("res://menu/preload.tscn")
