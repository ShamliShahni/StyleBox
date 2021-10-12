extends Control

var style_box = preload("res://assets/new_styleboxflat.tres")
var buttontex = preload("res://Images/yellow button.png")
var new_style = StyleBoxFlat.new()
onready var panel = get_node("Panel3")
onready var button = get_node("Button")

func _ready():
	new_style.bg_color = Color.aqua
	new_style.border_color = Color.blue
	new_style.corner_detail = 5
	new_style.border_width_bottom = 5
	new_style.border_width_top = 5
	new_style.border_width_left = 5
	new_style.border_width_right = 5
	new_style.shadow_color = Color.darkblue
	new_style.shadow_size = 5
	#new_style.border_blend = true
	
	panel.set('custom_styles/panel', new_style)


func _on_Button_pressed():
	print("click")


func _on_Button2_pressed():
	#print("222")
	new_style.corner_radius_bottom_left += 1
	new_style.corner_radius_bottom_right += 1
	new_style.corner_radius_top_left += 1
	new_style.corner_radius_top_right += 1
	panel.rect_size -= Vector2(1,1)
	#print(new_style.corner_radius_bottom_left)
	

func _on_Timer_timeout():
	
	#ctext.texture_normal = load("res://Images/yellow button.png")
	$ConfirmationDialog.window_title = "Hello"
	$ConfirmationDialog.add_icon_override("normal",buttontex)
	$ConfirmationDialog.add_stylebox_override("panel",new_style)
	#$ConfirmationDialog.add_stylebox_override("cancel_button",new_style)
	#$ConfirmationDialog.add_stylebox_override("close",new_style)
	$ConfirmationDialog.popup()
	var ctext = $ConfirmationDialog.get_close_button()
	#ctext.texture_normal = buttontex

func _process(delta):
	pass


func _on_Timer2_timeout():
	$WindowDialog.add_stylebox_override('panel',style_box)
	$WindowDialog.popup()
