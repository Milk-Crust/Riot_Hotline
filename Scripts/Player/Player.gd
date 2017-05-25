extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var movespeed = 150
enum states{
	shield,
	baton,
	shotgun,
	default
	}
var currentState = states.shotgun

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process(true);

func _process(delta):
	
	#turning character to look at mouse
	var mpos = get_global_mouse_pos();
	look_at(mpos);
	#moving handling
	#To DO:
	#1: input smoothing with some function?
	#2: sprite changing as walking
	#3: legs
	var delta_x = 0;
	var delta_y = 0;
	if(Input.is_action_pressed("game_left")):
		delta_x = -1;
	if(Input.is_action_pressed("game_down")):
		delta_y = 1;
	if(Input.is_action_pressed("game_right")):
		delta_x = 1;
	if(Input.is_action_pressed("game_up")):
		delta_y = -1;
	
	var Pos = self.get_pos();
	var newPos = Vector2();
	newPos.x = delta_x * delta * movespeed + Pos.x;
	newPos.y = delta_y * delta * movespeed + Pos.y;
	
	self.set_pos(newPos);
	
	#handling switching weapon sets
	#weapon sets are essentially player states
	var newState;
	if(Input.is_action_pressed("wep_set_0")):
		newState = states.shield;
	elif(Input.is_action_pressed("wep_set_1")):
		newState = states.baton;
	elif (Input.is_action_pressed("wep_set_2")):
		newState = states.shotgun;
	if(newState != null):
		stateTranstion(newState);

func stateTranstion(newState):
	if(newState != currentState):
		if(newState == states.shield):
			print("Selected Shield")
		elif(newState == states.baton):
			print("Selected Baton")
		elif(newState == states.shotgun):
			print("Selected Shotgun")
		currentState = newState;
		
	
