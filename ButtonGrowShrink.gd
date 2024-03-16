extends Button
var startscale
var maxscale
var growing = true

# Called when the node enters the scene tree for the first time.
func _ready():
	startscale = scale
	maxscale = scale * 1.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if growing:
		scale *= 1.001
		if scale >= maxscale:
			growing = false
	else:
		scale *= 0.999
		if scale <= startscale:
			growing = true
