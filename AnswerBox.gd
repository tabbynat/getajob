extends Node2D

var AnswerArr := [null,null,null,null]
var SpeechEmoji := [null,null,null,null]
var AnswerCount := 0
var AcceptInput := true

var E0 = load("res://Stage 3 Assets/Emoji1.png")
var E1 = load("res://Stage 3 Assets/Emoji2.png")
var E2 = load("res://Stage 3 Assets/Emoji3.png")
var E3 = load("res://Stage 3 Assets/Emoji4.png")

signal PlayerAnswer

# Called when the node enters the scene tree for the first time.
func _ready():
	SpeechEmoji = [$Q0, $Q1, $Q2, $Q3]
	AcceptInput = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func GetAnswer():
	for item in AnswerArr:
		item = null
	for item in SpeechEmoji:
		item.texture = null
	visible = true
	AcceptInput = true
	AnswerCount = 0

func _on_a_0_pressed():
	
	if AcceptInput:
		AnswerArr[AnswerCount] = 0
		SpeechEmoji[AnswerCount].texture = E0
		AnswerCount += 1
		if AnswerCount >= 4:
			PlayerAnswer.emit(AnswerArr)
			AcceptInput = false

func _on_a_1_pressed():

	if AcceptInput:
		AnswerArr[AnswerCount] = 1
		SpeechEmoji[AnswerCount].texture = E1
		AnswerCount += 1
		if AnswerCount >= 4:
			PlayerAnswer.emit(AnswerArr)
			AcceptInput = false

func _on_a_2_pressed():

	if AcceptInput:
		AnswerArr[AnswerCount] = 2
		SpeechEmoji[AnswerCount].texture = E2
		AnswerCount += 1
		if AnswerCount >= 4:
			PlayerAnswer.emit(AnswerArr)
			AcceptInput = false

func _on_a_3_pressed():

	if AcceptInput:
		AnswerArr[AnswerCount] = 3
		SpeechEmoji[AnswerCount].texture = E3
		AnswerCount += 1
		if AnswerCount >= 4:
			PlayerAnswer.emit(AnswerArr)
			AcceptInput = false
