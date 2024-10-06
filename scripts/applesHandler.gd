extends Node2D

# stores apples count score
#var appleCount = 0

#@export var lableTxt : Label

# preload apple scene
var apple_instance = preload("res://scenes/apple.tscn")

#var appleScore = preload($appleScore)

#screen vars
var screenSize = 0
var screen_hight = 100
var screen_width = 100

# generate new random num
var random = RandomNumberGenerator.new()

# number of apples spawned at once
var spawnNum = 100

# get apple score node
#var scoreTxt = 0

var label = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var scene_apple = preload("res://scenes/apple.tscn").instantiate()
	add_child(scene_apple)
	scene_apple.connect("applePressed", Callable(self, "test"))
	
	#get screen size
	screenSize = get_viewport().get_visible_rect().size
	screen_hight = screenSize.x
	screen_width = screenSize.y
	print("width: " , screenSize.x , " , hight: " , screenSize.y)
	
	#var appleNode = get_node("res://scripts/apple_button.gd")
	#print(appleNode)
	#$appleScoreLable.text = "kill me"
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#print(appleCount)
	
func spawn():
	for i in spawnNum:
		var obj = apple_instance.instantiate()
		#print(obj)
		obj.position = get_random_pos()
		#add obj to scene
		add_child(obj)
	
func delete(deleteThis):
	#updateScore()
	print("deleteee this bish")
	deleteThis.queue_free()
	
func get_random_pos():
	random.randomize()
	var x = random.randf_range(0, screen_hight-30)
	var y = random.randf_range(0, screen_width-30)
	#print("random", x,y)
	return Vector2(x,y)
	
func updateScore():
	pass
	#print(appleCount)
	#label.text = "Score: " + str(appleCount)
	#var label = get_node("Label")
	#label = get_node("appleScoreLable")
	#if label != null:
	#	print("found")
	#	label.text = "Score: " + str(appleCount)
	#else:
	#	print("Label node not found!")
	
	
