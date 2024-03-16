extends Area2D

@export var TargetCol := Color.BLUE
@export var CVTexture := load("res://Stage 1 Assets/00.png")
@export var CVPieceOriginGlobal := Vector2 (0,400)

signal PieceCompleted

var isHeld
var ReleasedCorrectly = false
var PieceDone = false
var LerpBack = false
var OverTarget = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$CVTarget/TargetColorRect.color = TargetCol
	$CVPiece/CVTargetSprite.texture = CVTexture
	
	$CVPiece.global_position = CVPieceOriginGlobal
	
	print(str($CVPiece.global_position))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isHeld and not PieceDone:
		$CVPiece.set_global_position(get_global_mouse_position())

	if LerpBack and not PieceDone:
		$CVPiece.global_position = $CVPiece.global_position.lerp(CVPieceOriginGlobal,delta * 10)

func _on_cv_target_mouse_entered():
	print("Over Target")
	OverTarget = true
	

func _on_cv_target_mouse_exited():
	print ("Exit Target")
	OverTarget = false


func _on_cv_piece_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and not PieceDone:
		if event.pressed:
			print("pressed")
			isHeld = true
			$CVPiece.z_index = 2
			$CVPiece.scale = Vector2(1.1,1.1)
		if not event.pressed:
			print("Unpressed")
			isHeld = false
			$CVPiece.z_index = 1
			$CVPiece.scale = Vector2(1,1)
			
			if not OverTarget:
				LerpBack = true
			
			else:
				$CVPiece.global_position = $CVTarget.global_position
				PieceDone = true
				PieceCompleted.emit()
