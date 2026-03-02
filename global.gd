extends Node

signal scramble_toggled(is_scrambled: bool)

var player_score: int = 0
var high_score: int = 0
var deaths: int = 0
var farthest_track: float
var speed_boost: float = 1
var scramble_controls: bool = false : set = _set_scramble

func _set_scramble(value: bool):
	scramble_controls = value
	scramble_toggled.emit(scramble_controls)
