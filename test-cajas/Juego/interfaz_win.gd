class_name Interfaz_win
extends CanvasLayer


@onready var scoreLabel = $PcontainerElements/VcontainerAll/HcontainerScore/ScoreLabel2
@onready var timeLabel =$PcontainerElements/VcontainerAll/HcontainerTime/TimeLabel2

func _ready() -> void:
	# calculo del score en base al tiempo
	var score = (float(GLOBAL.capture_time) / float(GLOBAL.time_initial)) * 100
	# asignacion a los Label
	scoreLabel.text = str(round(score))
	timeLabel.text = str(GLOBAL.capture_time)
