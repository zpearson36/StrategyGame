/// @description Insert description here
// You can write your code in this editor
main_button_array  = []
tile_button_array  = []
tile_details_array = []
trans_assignments  = []
destination_array  = []

enum GUISTATES
{
	MAIN,
	TILE,
	TILEDETAILS,
	TRANSPORTSELECTION,
	TRANSDESTSELECTION,
}
state = GUISTATES.MAIN