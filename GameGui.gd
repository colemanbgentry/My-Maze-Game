extends Control
onready var seconds_up_ones = $HBoxContainer/MarginContainer2/HBoxContainer/Seconds_Ones
onready var minutes_up_ones = $HBoxContainer/MarginContainer2/HBoxContainer/Minutes_Ones
onready var seconds_up_tens = $HBoxContainer/MarginContainer2/HBoxContainer/Seconds_Tens
onready var minutes_up_tens = $HBoxContainer/MarginContainer2/HBoxContainer/Minutes_Tens
var seconds_ones = 0
var minutes_ones = 0
var seconds_tens = 0
var minutes_tens = 0
func _on_Stopwatch_timeout():
	if seconds_ones < 10 and seconds_tens < 6:
		seconds_ones += 1
		var seconds_message = "%s" % seconds_ones
		seconds_up_ones.text = seconds_message
	if seconds_ones == 10 and seconds_tens < 6:
		seconds_ones = 0
		var seconds_message = "%s" % seconds_ones
		seconds_up_ones.text = seconds_message
		seconds_tens += 1
		var seconds_tens_message = "%s" % seconds_tens
		seconds_up_tens.text = seconds_tens_message
	if minutes_ones < 10 and seconds_tens == 6:
		seconds_ones = 0
		var seconds_message = "%s" % seconds_ones
		seconds_up_ones.text = seconds_message
		seconds_tens = 0
		var seconds_tens_message = "%s" % seconds_tens
		seconds_up_tens.text = seconds_tens_message
		minutes_ones += 1
		var minutes_ones_message = "%s" % minutes_ones
		minutes_up_ones.text = minutes_ones_message
	if minutes_ones == 10: 
		seconds_ones = 0
		var seconds_message = "%s" % seconds_ones
		seconds_up_ones.text = seconds_message
		seconds_tens = 0
		var seconds_tens_message = "%s" % seconds_tens
		seconds_up_tens.text = seconds_tens_message
		minutes_ones = 0
		var minutes_ones_message = "%s" % minutes_ones
		minutes_up_ones.text = minutes_ones_message
		minutes_tens += 1
		var minutes_tens_message = "%s" % minutes_tens
		minutes_up_tens.text = minutes_tens_message
