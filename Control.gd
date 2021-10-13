extends Control

var style_box = preload("res://assets/new_styleboxflat.tres")
var buttontex = preload("res://Images/yellow button.png")
var new_style = StyleBoxFlat.new()
var style2 = StyleBoxFlat.new()
var dyn_font = DynamicFont.new()
onready var panel = get_node("Panel3")


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
	style2.bg_color = Color.red
	dyn_font.font_data = load("res://fonts/Xolonium-Regular.ttf")
	dyn_font.size = 120
	
	panel.set('custom_styles/panel', new_style)
	
	

func _on_Button_pressed():
	print("click")


func _on_Button2_pressed():
	new_style.corner_radius_bottom_left += 1
	new_style.corner_radius_bottom_right += 1
	new_style.corner_radius_top_left += 1
	new_style.corner_radius_top_right += 1
	panel.rect_size -= Vector2(1,1)
	#print(new_style.corner_radius_bottom_left)
	

func _on_Timer_timeout():
	#dec_confirmbox()
	$ConfirmationDialog.popup()
	dec_confirmbox()
	

func dec_confirmbox():
#
#	$ConfirmationDialog.add_font_override('font',dyn_font)
#	$ConfirmationDialog.add_color_override("font_color", Color.red)
	#$ConfirmationDialog.set('title_color',Color.red)
	$ConfirmationDialog.show_behind_parent = true
	print($ConfirmationDialog.show_behind_parent)
	print($ConfirmationDialog.get_color('title_color'))
	
	$ConfirmationDialog.add_color_override('title_color',Color.aquamarine)
	print($ConfirmationDialog.get_color('title_color'))
	$WindowDialog.add_color_override('title_color',Color.red)
	#$WindowDialog.popup()
	$ConfirmationDialog.window_title = "Hello"
	var labeltext = $ConfirmationDialog.get_child(1)
	labeltext.add_font_override("font",dyn_font)
	labeltext.add_color_override("font_color",Color.red)
	#$ConfirmationDialog.add_icon_override("normal",buttontex)
	$ConfirmationDialog.add_stylebox_override("panel",new_style)
	var okbut = $ConfirmationDialog.get_ok()
	var ctext = $ConfirmationDialog.get_cancel()
	ctext.set('rect_size',Vector2(300,300))
	#ctext.rect_size = Vector2(200,200)
	#ctext.rect_position = Vector2(0,-500)
	#print(ctext.rect_position)
	#okbut.set('custom_styles/normal', style2)
	okbut.set('custom_styles/focus', style2)
	okbut.set('custom_styles/hover', style2)
	okbut.set('custom_styles/pressed', style2)
	ctext.set('custom_styles/normal', style2)
	ctext.set('custom_styles/focus', style2)
	ctext.set('custom_styles/hover', style2)
	ctext.set('custom_styles/pressed', style2)
	print($ConfirmationDialog.get_child_count())
	print($ConfirmationDialog.get_children())
	var lb = $ConfirmationDialog.get_label()
	lb.add_stylebox_override('normal',new_style)
	
	
	for item in $ConfirmationDialog.get_children():
		print(item.name)
		if(item.name=="@@4"):
			for child in item.get_children():
				print(child)
		pass
