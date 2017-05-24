extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var movespeed = 150

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true);

func _process(delta):
	var mpos = get_global_mouse_pos();
	look_at(mpos);
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
	
