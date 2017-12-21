-- Automation 4
-- Generate CP9 effects

script_name = "Mes Outils"
script_description = "Une petite boite a outils."
script_author = "Chien-Rouge"
script_version = "alpha"

include("karaskel-adv.lua")
include("utils.lua")

function prepareAndComment(subtitles, selected_lines, active_line)
	
	-- Obtient le nombre de ligne
	num_lines = #selected_lines
	
	-- Variable pour pouvoir incrémenter les lignes d'insertion
	a = 0
	
	for z, i in ipairs(selected_lines) do
	
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i+a]
		-- meta, styles = karaskel.collect_head(subtitles, false)
		-- karaskel.preproc_line(subtitles, meta, styles, line)
		
		line.comment = true
		subtitles.insert(i+a,line)
		
		a = a + 1
		
	end
	
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("US Comment->Fr")
	
end

aegisub.register_macro("US Comment->Fr", script_description, prepareAndComment)