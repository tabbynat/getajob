extends Node2D

signal Applied

var JobTitleArr = ["General Counsel", "Chief Legal Officer (CLO)", "Corporate Counsel", "Associate General Counsel",\
 "Senior Counsel", "Legal Counsel", "Assistant General Counsel", "Deputy General Counsel", "Director of Legal Affairs",\
 "Legal Advisor", "Compliance Counsel", "Regulatory Counsel", "Employment Counsel", "Contracts Counsel", \
"Intellectual Property Counsel", "Litigation Counsel", "Privacy Counsel", "Real Estate Counsel", "Securities Counsel", \
"Director of Shenanigans", "Dream Alchemist","Chief Happiness Officer (CHO)","Wizard of Light Bulb Moments","Ninja Problem Solver", "Cat Wrangler"]

var JobDescArr = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut suscipit, libero et feugiat accumsan, odio tellus finibus elit, sit amet imperdiet enim felis eu eros.",\
"Cras eget ante sagittis, ullamcorper sapien in, fermentum magna. Nam congue congue ipsum quis eleifend. Curabitur interdum vitae mi varius dapibus.",\
"Vestibulum quis justo purus. Suspendisse potenti. Nunc malesuada leo id venenatis accumsan. Nulla facilisi. Proin placerat ullamcorper ex, cursus dictum elit vehicula elementum.",\
"Praesent nulla ipsum, ultricies sit amet interdum at, consectetur eget felis. Cras eleifend facilisis urna non condimentum. Quisque laoreet massa sit amet ante suscipit, tempus bibendum leo dignissim.",\
"Ut at risus nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fermentum sapien ligula, non efficitur eros commodo ut. Pellentesque arcu diam, iaculis sed risus eu, volutpat accumsan lacus.",\
"Cras vel interdum augue, ac malesuada ex. Integer convallis egestas lectus vel sagittis. Donec vehicula consequat mauris tristique ornare. Aenean eget malesuada quam. Aenean purus risus, gravida vitae purus ut, dapibus dictum neque.",\
"Nullam finibus, orci ut luctus rhoncus, orci urna condimentum neque, nec pretium augue justo nec dui. Fusce ultricies ex nec ex viverra, sed vulputate leo ullamcorper. Vestibulum molestie, tellus id commodo facilisis, felis libero tristique ligula, luctus aliquam ex massa vel turpis.",\
"Aenean bibendum mi nunc, sit amet dapibus lectus interdum id. Integer viverra auctor sapien, sit amet ultricies lacus posuere vitae. Integer dictum dignissim vestibulum.",\
"Ut et nulla hendrerit, pulvinar tortor ac, lobortis tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam feugiat facilisis elit nec sodales. Aenean mollis nisl vel justo ullamcorper egestas.",\
"Morbi augue mauris, vestibulum sed urna ut, faucibus dignissim tellus. Praesent ultrices rutrum eros non venenatis. Maecenas congue magna quis enim blandit, sed tincidunt lorem facilisis. Duis massa augue, imperdiet ullamcorper eleifend at, tincidunt scelerisque lacus.",\
"Etiam faucibus vehicula auctor. Sed tempor turpis ac mi venenatis bibendum. Donec risus erat, egestas sed lectus quis, scelerisque rhoncus nibh. Donec a euismod turpis. Aliquam lacinia augue enim, et convallis orci pellentesque vitae.",\
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur neque sem, lacinia non mi a, pretium consectetur felis. Cras rhoncus, nisi non efficitur semper, enim enim tempus leo, nec imperdiet quam elit mattis arcu.",\
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempor semper ante. Quisque sagittis aliquam justo, vitae ullamcorper diam feugiat vel. Aliquam commodo dignissim nibh a fermentum.",\
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quam diam, vehicula vel magna et, interdum egestas dolor. Ut vitae sollicitudin libero. Donec sed ex condimentum erat pellentesque porttitor quis congue tortor."]

var LogoArr = [preload("res://Stage 2 Assets/Logo1.png"),preload("res://Stage 2 Assets/Logo2.png"),preload("res://Stage 2 Assets/Logo3.png"),\
preload("res://Stage 2 Assets/Logo4.png"),preload("res://Stage 2 Assets/Logo5.png"),preload("res://Stage 2 Assets/Logo6.png"),\
preload("res://Stage 2 Assets/Logo7.png"),preload("res://Stage 2 Assets/Logo8.png"),preload("res://Stage 2 Assets/Logo9.png"),]

var tx_Tick = preload("res://Stage 2 Assets/Tick.png")
var tx_Apply = preload("res://Stage 2 Assets/Apply.png")

var ApplyPositions = [Vector2(40,300), Vector2(260,300), Vector2(480,300)]

var movement = Vector2(0, -200)

# Called when the node enters the scene tree for the first time.
func _ready():
	$JobDescription.text = JobDescArr.pick_random()
	$JobTitle.text = JobTitleArr.pick_random()
	$Logo.texture = LogoArr.pick_random()
	$Apply.position = ApplyPositions.pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += movement * delta

	if position.y < -400:
		$JobDescription.text = JobDescArr.pick_random()
		$JobTitle.text = JobTitleArr.pick_random()
		$Logo.texture = LogoArr.pick_random()
		$Apply.texture_normal = tx_Apply
		position.y = 1600
		

func _on_apply_pressed():
	if $Apply.texture_normal != tx_Tick:
		emit_signal("Applied")
	$Apply.texture_normal = tx_Tick
	
	

