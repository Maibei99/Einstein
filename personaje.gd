extends Area2D

const UP = Vector2(0,-1)
# var a = 2
# var b = "text"
const GRAVITY =20
const MAXFALLSPEED =200
const MAXSPEED = 40
const JUMPFORCE = 300
var Moviemiento= Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	Moviemiento.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		Moviemiento.x += MAXSPEED
	if Input.is_action_pressed("ui_left"):
		Moviemiento.x += -MAXSPEED

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			Moviemiento.y += -JUMPFORCE
	if Moviemiento.y > MAXFALLSPEED:
		Moviemiento.y = MAXFALLSPEED
	#if Moviemiento.length()>0:
	#	Moviemiento = Moviemiento.normalized() * Velocidad
	#position += Moviemiento * delta
	else:
		Moviemiento.x = 0
		
	Movimiento = move_and_slide(Moviemiento, ui_up)
