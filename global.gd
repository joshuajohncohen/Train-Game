extends Node

# These variables will persist across all scenes
var player_score: int = 0
var high_score: int = 0
var deaths: int = 0
var farthest_track: float
var speed_boost: float = 1
var scramble_controls: bool = false : set = _set_scramble
