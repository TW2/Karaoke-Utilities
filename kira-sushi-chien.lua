-- Automation 4

script_name = "[Kira] Lignes centrees"
script_description = "Centrer et pas se fatiguer"
script_author = "Kira Sushi Chien-Rouge"
script_version = "1"

-- On ajoute les fonctions avancées de karaskel et quelques outils si nécessaires
include("karaskel.lua")
include("utils.lua")
include("unicode.lua")

-- On créé une fonction pour centrer tous les sous-titres contenant un \N et des tirets
function center_subs(subs, sel)

	-- Pour chaque lignes sélectionnées :
	for i = 1, #sel do
		-- On récupère l'objet ligne ici appelé "l"
		local l = subs[sel[i]]
		
		-- Si le style de la ligne porte le nom désiré :
		if l.style == "tiret" then
			-- On récupère un tableau de deux valeurs que l'on transforme en type String
			-- La ligne doit obligatoirement avoir un \N
			-- TODO : Faire que ça plante pas si pas de \N
			local t = {} ; t = mysplit(l.text, "\\N")			
			local t1 = tostring(t[1])
			local t2 = tostring(t[2])
			
			-- On récupère les dimensions du texte
			-- ==============================================================================
			-- mystyle2array(subs, style) récupère ici le tableau style du fichier ASS
			-- portant le nom l.style (contenant donc les paramètres de la police) afin
			-- de calculer les dimensions exactes
			-- ==============================================================================
			-- t1 est ici notre première sous lignes de texte qui a été cast en String
			-- précédament
			-- ==============================================================================
			-- On récupère la valeur de la largeur (width) que l'on met dans une variable
			-- ==============================================================================
			width, height, descent, ext_lead = aegisub.text_extents(mystyle2array(subs, l.style), t1)
			w1 = width
			
			width, height, descent, ext_lead = aegisub.text_extents(mystyle2array(subs, l.style), t2)
			w2 = width
			
			-- On récupère la valeur max afin de centrer dessus
			w = mymax(w1, w2)
			
			-- On récupère les valeurs de la vidéo
			xres, yres, ar, artype = aegisub.video_size()
			
			-- On fait un peu de calcul mental
			-- TODO : Que Kira décide ici de combien de pourcentage (yres * 90 / 100) il veut
			xa = (xres - w) / 2
			ya = yres * 90 / 100
			
			-- On crée la ligne à réimplanter puis on l'assigne au même index
			l.text = "{\\an1\\pos(" .. xa .. "," .. ya .. ")}" .. l.text
			subs[sel[i]] = l
		end
	end
	-- On crée une annulation d'effets (si besoin d'annuler les modifications)
	aegisub.set_undo_point("[Kira] Lignes avec tirets centrees")
end

-- On enregistre la fonction "center_subs" dans le programme afin de pouvoir l'utiliser
-- dans le sous menu d'Automatisation (automation)
aegisub.register_macro("[Kira] Lignes avec tirets centrees", "Centrer et pas se fatiguer", center_subs)




--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Fonction qui retourne le maximum des deux valeurs d'entrée
--============================================================================================
-- numberOne >> un chiffre
-- numberTwo >> un chiffre
--============================================================================================
-- Retourne un chiffre
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function mymax(numberOne, numberTwo)
	if numberOne > numberTwo then
		return numberOne
	elseif numberOne < numberTwo then
		return numberTwo
	else
		return numberOne
	end
end

--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Fonction qui sépare un texte en deux ou plus si on y trouve un ou des \N 
--============================================================================================
-- str >> un texte
-- pat >> une chaine regex ou un caractère comdamné à l'exil
--============================================================================================
-- Retourne un tableau de texte
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Compatibility: Lua-5.1 -- http://lua-users.org/wiki/SplitJoin
function mysplit(str, pat)
	local t = {}  -- NOTE: use {n = 0} in Lua-5.0
	local fpat = "(.-)" .. pat
	local last_end = 1
	local s, e, cap = str:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(t,cap)
			-- aegisub.debug.out(string.format('t[n] : %s \n', cap))
		end
		last_end = e+1
		s, e, cap = str:find(fpat, last_end)
	end
	if last_end <= #str then
		cap = str:sub(last_end)
		table.insert(t, cap)
		-- aegisub.debug.out(string.format('t[n] : %s \n', cap))
	end
	return t
end

--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Fonction qui recherche le tableau du style à partir de son nom 
--============================================================================================
-- subs >> le sous titre en mode tableau
-- strName >> un nom de style
--============================================================================================
-- Retourne le tableau d'un style
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function mystyle2array(subs, strName)
	meta, styles = karaskel.collect_head(subs, false)
	
	local s = {}
	
	for i=1, styles.n do
		sty_array = styles[i]
		if strName == sty_array.name then
			s = sty_array
		end
	end
	
	return s
end





--==========================================================================================
-- Césure de Kira et Yuuko
--==========================================================================================
-- perso voilà ce que j'applique en général pour la césure
-- On place la césure avant une conjonction de subordination/coordination ou une préposition.
-- 
-- - qui, que, quoi, dont, où, lequel, laquelle, duquel, (conj de sub relative)
-- - parce que, lorsque, quand, puisque, si, etc (conj de sub complétive)
-- - mais, ou, et, donc, or, ni, car (conj. de coordination)
-- - de, à, vers, près de, chez, devant, dans, sans, contre… (prépositions)
-- 
-- La conjonction de subordination "puisque" et de coordination "mais, donc, car",
-- c'est assez évident, car il y a une virgule avant…
-- 
-- Quelques exemples :
-- 
-- Ce ne sont pas les bons joueurs \Nqu'il nous manque.
-- 
-- Le train a eu du retard le jour \Noù elle est partie.
-- 
-- Je ne t'avais pas dit hier soir \Nde rebondir sur tes pieds ?
-- 
-- Je le sais déjà depuis très longtemps, \Npuisque j'y suis allée…
-- 
-- Cela n'a jamais été un secret pour personne, \Ndonc peu de gens l'ignorait…
-- 
-- Concernant Que : On peut placer la césure avant ou apres mes de préférence avant, césurer apres "Que" uniquement si la ligne du bas et trop chargé.
--==========================================================================================

--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
-- conjonction de subordination relative (pronoms relatifs)
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
function getCSrelative()
	local csrelative = {}
	-- Les cinq pronoms invariables :
	table.insert(csrelative, "qui")
	table.insert(csrelative, "que")
	table.insert(csrelative, "quoi")
	table.insert(csrelative, "dont")
	table.insert(csrelative, "où")
	-- Le pronom variable "lequel" :
	table.insert(csrelative, "lequel")
	table.insert(csrelative, "laquelle")
	table.insert(csrelative, "lesquels")
	table.insert(csrelative, "lesquelles")
	table.insert(csrelative, "duquel")
	table.insert(csrelative, "de laquelle")
	table.insert(csrelative, "desquels")
	table.insert(csrelative, "desquelles")
	table.insert(csrelative, "auquel")
	table.insert(csrelative, "à laquelle")
	table.insert(csrelative, "auxquels")
	table.insert(csrelative, "auxquelles")
	
	return csrelative
end
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
-- conjonction de subordination complétive (conjonctions de subordination)
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
function getCScompletive()
	local cscompletive = {}
	-- que
	table.insert(cscompletive, "que")
	table.insert(cscompletive, "qu'il")
	table.insert(cscompletive, "qu'elle")
	table.insert(cscompletive, "qu'on")
	table.insert(cscompletive, "qu'ils")
	table.insert(cscompletive, "qu'elles")
	-- quand
	table.insert(cscompletive, "quand")
	-- comme
	table.insert(cscompletive, "comme")
	-- si
	table.insert(cscompletive, "si")
	table.insert(cscompletive, "s'il")
	table.insert(cscompletive, "s'ils")
	-- lorsque
	table.insert(cscompletive, "lorsque")
	table.insert(cscompletive, "lorsqu'il")
	table.insert(cscompletive, "lorsqu'elle")
	table.insert(cscompletive, "lorsqu'on")
	table.insert(cscompletive, "lorsqu'ils")
	table.insert(cscompletive, "lorsqu'elles")
	-- puisque
	table.insert(cscompletive, "puisque")
	table.insert(cscompletive, "puisqu'il")
	table.insert(cscompletive, "puisqu'elle")
	table.insert(cscompletive, "puisqu'on")
	table.insert(cscompletive, "puisqu'ils")
	table.insert(cscompletive, "puisqu'elles")
	-- quoique
	table.insert(cscompletive, "quoique")
	table.insert(cscompletive, "quoiqu'il")
	table.insert(cscompletive, "quoiqu'elle")
	table.insert(cscompletive, "quoiqu'on")
	table.insert(cscompletive, "quoiqu'ils")
	table.insert(cscompletive, "quoiqu'elles")
	-- de manière (que)
	table.insert(cscompletive, "de manière que")
	table.insert(cscompletive, "de manière qu'il")
	table.insert(cscompletive, "de manière qu'elle")
	table.insert(cscompletive, "de manière qu'on")
	table.insert(cscompletive, "de manière qu'ils")
	table.insert(cscompletive, "de manière qu'elles")
	table.insert(cscompletive, "de manière")
	-- en sorte que
	table.insert(cscompletive, "en sorte que")
	table.insert(cscompletive, "en sorte qu'il")
	table.insert(cscompletive, "en sorte qu'elle")
	table.insert(cscompletive, "en sorte qu'on")
	table.insert(cscompletive, "en sorte qu'ils")
	table.insert(cscompletive, "en sorte qu'elles")
	-- pour que
	table.insert(cscompletive, "pour que")
	table.insert(cscompletive, "pour qu'il")
	table.insert(cscompletive, "pour qu'elle")
	table.insert(cscompletive, "pour qu'on")
	table.insert(cscompletive, "pour qu'ils")
	table.insert(cscompletive, "pour qu'elles")
	-- donc
	table.insert(cscompletive, "donc")
	-- c'est pourquoi
	table.insert(cscompletive, "c'est pourquoi")
	-- afin que
	table.insert(cscompletive, "afin que")
	table.insert(cscompletive, "afin qu'il")
	table.insert(cscompletive, "afin qu'elle")
	table.insert(cscompletive, "afin qu'on")
	table.insert(cscompletive, "afin qu'ils")
	table.insert(cscompletive, "afin qu'elles")
	-- de façon que
	table.insert(cscompletive, "de façon que")
	table.insert(cscompletive, "de façon qu'il")
	table.insert(cscompletive, "de façon qu'elle")
	table.insert(cscompletive, "de façon qu'on")
	table.insert(cscompletive, "de façon qu'ils")
	table.insert(cscompletive, "de façon qu'elles")
	-- alors que
	table.insert(cscompletive, "alors que")
	table.insert(cscompletive, "alors qu'il")
	table.insert(cscompletive, "alors qu'elle")
	table.insert(cscompletive, "alors qu'on")
	table.insert(cscompletive, "alors qu'ils")
	table.insert(cscompletive, "alors qu'elles")	
	-- tandis que
	table.insert(cscompletive, "tandis que")
	table.insert(cscompletive, "tandis qu'il")
	table.insert(cscompletive, "tandis qu'elle")
	table.insert(cscompletive, "tandis qu'on")
	table.insert(cscompletive, "tandis qu'ils")
	table.insert(cscompletive, "tandis qu'elles")	
	-- dès que
	table.insert(cscompletive, "dès que")
	table.insert(cscompletive, "dès qu'il")
	table.insert(cscompletive, "dès qu'elle")
	table.insert(cscompletive, "dès qu'on")
	table.insert(cscompletive, "dès qu'ils")
	table.insert(cscompletive, "dès qu'elles")	
	-- à mesure que
	table.insert(cscompletive, "à mesure que")
	table.insert(cscompletive, "à mesure qu'il")
	table.insert(cscompletive, "à mesure qu'elle")
	table.insert(cscompletive, "à mesure qu'on")
	table.insert(cscompletive, "à mesure qu'ils")
	table.insert(cscompletive, "à mesure qu'elles")	
	-- après que
	table.insert(cscompletive, "après que")
	table.insert(cscompletive, "après qu'il")
	table.insert(cscompletive, "après qu'elle")
	table.insert(cscompletive, "après qu'on")
	table.insert(cscompletive, "après qu'ils")
	table.insert(cscompletive, "après qu'elles")	
	-- au fur et à mesure que
	table.insert(cscompletive, "au fur et à mesure que")
	table.insert(cscompletive, "au fur et à mesure qu'il")
	table.insert(cscompletive, "au fur et à mesure qu'elle")
	table.insert(cscompletive, "au fur et à mesure qu'on")
	table.insert(cscompletive, "au fur et à mesure qu'ils")
	table.insert(cscompletive, "au fur et à mesure qu'elles")	
	-- au moment où
	table.insert(cscompletive, "au moment où")	
	-- aussitôt que
	table.insert(cscompletive, "aussitôt que")
	table.insert(cscompletive, "aussitôt qu'il")
	table.insert(cscompletive, "aussitôt qu'elle")
	table.insert(cscompletive, "aussitôt qu'on")
	table.insert(cscompletive, "aussitôt qu'ils")
	table.insert(cscompletive, "aussitôt qu'elles")	
	-- avant que
	table.insert(cscompletive, "avant que")
	table.insert(cscompletive, "avant qu'il")
	table.insert(cscompletive, "avant qu'elle")
	table.insert(cscompletive, "avant qu'on")
	table.insert(cscompletive, "avant qu'ils")
	table.insert(cscompletive, "avant qu'elles")	
	-- chaque fois que
	table.insert(cscompletive, "chaque fois que")
	table.insert(cscompletive, "chaque fois qu'il")
	table.insert(cscompletive, "chaque fois qu'elle")
	table.insert(cscompletive, "chaque fois qu'on")
	table.insert(cscompletive, "chaque fois qu'ils")
	table.insert(cscompletive, "chaque fois qu'elles")	
	-- sitôt que
	table.insert(cscompletive, "sitôt que")
	table.insert(cscompletive, "sitôt qu'il")
	table.insert(cscompletive, "sitôt qu'elle")
	table.insert(cscompletive, "sitôt qu'on")
	table.insert(cscompletive, "sitôt qu'ils")
	table.insert(cscompletive, "sitôt qu'elles")	
	-- depuis que
	table.insert(cscompletive, "depuis que")
	table.insert(cscompletive, "depuis qu'il")
	table.insert(cscompletive, "depuis qu'elle")
	table.insert(cscompletive, "depuis qu'on")
	table.insert(cscompletive, "depuis qu'ils")
	table.insert(cscompletive, "depuis qu'elles")	
	-- d'ici à ce que
	table.insert(cscompletive, "d'ici à ce que")
	table.insert(cscompletive, "d'ici à ce qu'il")
	table.insert(cscompletive, "d'ici à ce qu'elle")
	table.insert(cscompletive, "d'ici à ce qu'on")
	table.insert(cscompletive, "d'ici à ce qu'ils")
	table.insert(cscompletive, "d'ici à ce qu'elles")	
	-- durant que
	table.insert(cscompletive, "durant que")
	table.insert(cscompletive, "durant qu'il")
	table.insert(cscompletive, "durant qu'elle")
	table.insert(cscompletive, "durant qu'on")
	table.insert(cscompletive, "durant qu'ils")
	table.insert(cscompletive, "durant qu'elles")	
	-- jusqu'à ce que
	table.insert(cscompletive, "jusqu'à ce que")
	table.insert(cscompletive, "jusqu'à ce qu'il")
	table.insert(cscompletive, "jusqu'à ce qu'elle")
	table.insert(cscompletive, "jusqu'à ce qu'on")
	table.insert(cscompletive, "jusqu'à ce qu'ils")
	table.insert(cscompletive, "jusqu'à ce qu'elles")	
	-- le plus tôt que
	table.insert(cscompletive, "le plus tôt que")
	table.insert(cscompletive, "le plus tôt qu'il")
	table.insert(cscompletive, "le plus tôt qu'elle")
	table.insert(cscompletive, "le plus tôt qu'on")
	table.insert(cscompletive, "le plus tôt qu'ils")
	table.insert(cscompletive, "le plus tôt qu'elles")	
	-- maintenant que
	table.insert(cscompletive, "maintenant que")
	table.insert(cscompletive, "maintenant qu'il")
	table.insert(cscompletive, "maintenant qu'elle")
	table.insert(cscompletive, "maintenant qu'on")
	table.insert(cscompletive, "maintenant qu'ils")
	table.insert(cscompletive, "maintenant qu'elles")	
	-- pendant que
	table.insert(cscompletive, "pendant que")
	table.insert(cscompletive, "pendant qu'il")
	table.insert(cscompletive, "pendant qu'elle")
	table.insert(cscompletive, "pendant qu'on")
	table.insert(cscompletive, "pendant qu'ils")
	table.insert(cscompletive, "pendant qu'elles")	
	-- quelque
	table.insert(cscompletive, "quelque")
	table.insert(cscompletive, "quelqu'il")
	table.insert(cscompletive, "quelqu'elle")
	table.insert(cscompletive, "quelqu'on")
	table.insert(cscompletive, "quelqu'ils")
	table.insert(cscompletive, "quelqu'elles")	
	-- sans que
	table.insert(cscompletive, "sans que")
	table.insert(cscompletive, "sans qu'il")
	table.insert(cscompletive, "sans qu'elle")
	table.insert(cscompletive, "sans qu'on")
	table.insert(cscompletive, "sans qu'ils")
	table.insert(cscompletive, "sans qu'elles")	
	-- au lieu que
	table.insert(cscompletive, "au lieu que")
	table.insert(cscompletive, "au lieu qu'il")
	table.insert(cscompletive, "au lieu qu'elle")
	table.insert(cscompletive, "au lieu qu'on")
	table.insert(cscompletive, "au lieu qu'ils")
	table.insert(cscompletive, "au lieu qu'elles")	
	-- malgré que
	table.insert(cscompletive, "malgré que")
	table.insert(cscompletive, "malgré qu'il")
	table.insert(cscompletive, "malgré qu'elle")
	table.insert(cscompletive, "malgré qu'on")
	table.insert(cscompletive, "malgré qu'ils")
	table.insert(cscompletive, "malgré qu'elles")	
	-- bien que
	table.insert(cscompletive, "bien que")
	table.insert(cscompletive, "bien qu'il")
	table.insert(cscompletive, "bien qu'elle")
	table.insert(cscompletive, "bien qu'on")
	table.insert(cscompletive, "bien qu'ils")
	table.insert(cscompletive, "bien qu'elles")	
	-- en admettant que
	table.insert(cscompletive, "en admettant que")
	table.insert(cscompletive, "en admettant qu'il")
	table.insert(cscompletive, "en admettant qu'elle")
	table.insert(cscompletive, "en admettant qu'on")
	table.insert(cscompletive, "en admettant qu'ils")
	table.insert(cscompletive, "en admettant qu'elles")	
	-- encore que
	table.insert(cscompletive, "encore que")
	table.insert(cscompletive, "encore qu'il")
	table.insert(cscompletive, "encore qu'elle")
	table.insert(cscompletive, "encore qu'on")
	table.insert(cscompletive, "encore qu'ils")
	table.insert(cscompletive, "encore qu'elles")	
	-- même si
	table.insert(cscompletive, "même si")
	table.insert(cscompletive, "même s'il")
	table.insert(cscompletive, "même s'ils")	
	-- plutôt que
	table.insert(cscompletive, "plutôt que")
	table.insert(cscompletive, "plutôt qu'il")
	table.insert(cscompletive, "plutôt qu'elle")
	table.insert(cscompletive, "plutôt qu'on")
	table.insert(cscompletive, "plutôt qu'ils")
	table.insert(cscompletive, "plutôt qu'elles")
	-- sauf que
	table.insert(cscompletive, "sauf que")
	table.insert(cscompletive, "sauf qu'il")
	table.insert(cscompletive, "sauf qu'elle")
	table.insert(cscompletive, "sauf qu'on")
	table.insert(cscompletive, "sauf qu'ils")
	table.insert(cscompletive, "sauf qu'elles")
	-- si ce n'est que
	table.insert(cscompletive, "si ce n'est que")
	table.insert(cscompletive, "si ce n'est qu'il")
	table.insert(cscompletive, "si ce n'est qu'elle")
	table.insert(cscompletive, "si ce n'est qu'on")
	table.insert(cscompletive, "si ce n'est qu'ils")
	table.insert(cscompletive, "si ce n'est qu'elles")	
	-- ainsi que
	table.insert(cscompletive, "ainsi que")
	table.insert(cscompletive, "ainsi qu'il")
	table.insert(cscompletive, "ainsi qu'elle")
	table.insert(cscompletive, "ainsi qu'on")
	table.insert(cscompletive, "ainsi qu'ils")
	table.insert(cscompletive, "ainsi qu'elles")	
	-- de même que
	table.insert(cscompletive, "de même que")
	table.insert(cscompletive, "de même qu'il")
	table.insert(cscompletive, "de même qu'elle")
	table.insert(cscompletive, "de même qu'on")
	table.insert(cscompletive, "de même qu'ils")
	table.insert(cscompletive, "de même qu'elles")	
	-- aussi que
	table.insert(cscompletive, "aussi que")
	table.insert(cscompletive, "aussi qu'il")
	table.insert(cscompletive, "aussi qu'elle")
	table.insert(cscompletive, "aussi qu'on")
	table.insert(cscompletive, "aussi qu'ils")
	table.insert(cscompletive, "aussi qu'elles")	
	-- autant que
	table.insert(cscompletive, "autant que")
	table.insert(cscompletive, "autant qu'il")
	table.insert(cscompletive, "autant qu'elle")
	table.insert(cscompletive, "autant qu'on")
	table.insert(cscompletive, "autant qu'ils")
	table.insert(cscompletive, "autant qu'elles")	
	-- tel que
	table.insert(cscompletive, "tel que")
	table.insert(cscompletive, "tel qu'il")
	table.insert(cscompletive, "tel qu'elle")
	table.insert(cscompletive, "tel qu'on")
	table.insert(cscompletive, "tel qu'ils")
	table.insert(cscompletive, "tel qu'elles")
	-- tel
	table.insert(cscompletive, "tel")	
	-- autrement que
	table.insert(cscompletive, "autrement que")
	table.insert(cscompletive, "autrement qu'il")
	table.insert(cscompletive, "autrement qu'elle")
	table.insert(cscompletive, "autrement qu'on")
	table.insert(cscompletive, "autrement qu'ils")
	table.insert(cscompletive, "autrement qu'elles")	
	-- dans la mesure où
	table.insert(cscompletive, "dans la mesure où")	
	-- d'autant plus que
	table.insert(cscompletive, "d'autant plus que")
	table.insert(cscompletive, "d'autant plus qu'il")
	table.insert(cscompletive, "d'autant plus qu'elle")
	table.insert(cscompletive, "d'autant plus qu'on")
	table.insert(cscompletive, "d'autant plus qu'ils")
	table.insert(cscompletive, "d'autant plus qu'elles")	
	-- moins que
	table.insert(cscompletive, "moins que")
	table.insert(cscompletive, "moins qu'il")
	table.insert(cscompletive, "moins qu'elle")
	table.insert(cscompletive, "moins qu'on")
	table.insert(cscompletive, "moins qu'ils")
	table.insert(cscompletive, "moins qu'elles")	
	-- plus que
	table.insert(cscompletive, "plus que")
	table.insert(cscompletive, "plus qu'il")
	table.insert(cscompletive, "plus qu'elle")
	table.insert(cscompletive, "plus qu'on")
	table.insert(cscompletive, "plus qu'ils")
	table.insert(cscompletive, "plus qu'elles")	
	-- à condition que
	table.insert(cscompletive, "à condition que")
	table.insert(cscompletive, "à condition qu'il")
	table.insert(cscompletive, "à condition qu'elle")
	table.insert(cscompletive, "à condition qu'on")
	table.insert(cscompletive, "à condition qu'ils")
	table.insert(cscompletive, "à condition qu'elles")
	-- supposé que
	table.insert(cscompletive, "supposé que")
	table.insert(cscompletive, "supposé qu'il")
	table.insert(cscompletive, "supposé qu'elle")
	table.insert(cscompletive, "supposé qu'on")
	table.insert(cscompletive, "supposé qu'ils")
	table.insert(cscompletive, "supposé qu'elles")	
	-- à supposer que
	table.insert(cscompletive, "à supposer que")
	table.insert(cscompletive, "à supposer qu'il")
	table.insert(cscompletive, "à supposer qu'elle")
	table.insert(cscompletive, "à supposer qu'on")
	table.insert(cscompletive, "à supposer qu'ils")
	table.insert(cscompletive, "à supposer qu'elles")	
	-- au cas où
	table.insert(cscompletive, "au cas où")	
	-- à moins que
	table.insert(cscompletive, "à moins que")
	table.insert(cscompletive, "à moins qu'il")
	table.insert(cscompletive, "à moins qu'elle")
	table.insert(cscompletive, "à moins qu'on")
	table.insert(cscompletive, "à moins qu'ils")
	table.insert(cscompletive, "à moins qu'elles")	
	-- en cas que
	table.insert(cscompletive, "en cas que")
	table.insert(cscompletive, "en cas qu'il")
	table.insert(cscompletive, "en cas qu'elle")
	table.insert(cscompletive, "en cas qu'on")
	table.insert(cscompletive, "en cas qu'ils")
	table.insert(cscompletive, "en cas qu'elles")	
	-- pourvu que
	table.insert(cscompletive, "pourvu que")
	table.insert(cscompletive, "pourvu qu'il")
	table.insert(cscompletive, "pourvu qu'elle")
	table.insert(cscompletive, "pourvu qu'on")
	table.insert(cscompletive, "pourvu qu'ils")
	table.insert(cscompletive, "pourvu qu'elles")	
	-- selon que
	table.insert(cscompletive, "selon que")
	table.insert(cscompletive, "selon qu'il")
	table.insert(cscompletive, "selon qu'elle")
	table.insert(cscompletive, "selon qu'on")
	table.insert(cscompletive, "selon qu'ils")
	table.insert(cscompletive, "selon qu'elles")	
	-- suivant que
	table.insert(cscompletive, "suivant que")
	table.insert(cscompletive, "suivant qu'il")
	table.insert(cscompletive, "suivant qu'elle")
	table.insert(cscompletive, "suivant qu'on")
	table.insert(cscompletive, "suivant qu'ils")
	table.insert(cscompletive, "suivant qu'elles")	
	-- moyennant que
	table.insert(cscompletive, "moyennant que")
	table.insert(cscompletive, "moyennant qu'il")
	table.insert(cscompletive, "moyennant qu'elle")
	table.insert(cscompletive, "moyennant qu'on")
	table.insert(cscompletive, "moyennant qu'ils")
	table.insert(cscompletive, "moyennant qu'elles")
	
	local avecFR = {}
	for i=1, #cscompletive do
		strReform = tostring(cscompletive[i])
		if string.find(strReform, "'") then			
			strReform = string.gsub(strReform, "'", "’")
			table.insert(avecFR, strReform)
		end
	end
	
	for i=1, #avecFR do
		table.insert(cscompletive, avecFR[i])
	end
	
	return cscompletive
end
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
-- conjonctions de coordination >> mais, ou, et, donc, or, ni, car
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
function getCScoordination()
	local cscoordination = {}
	table.insert(cscoordination, "mais")
	table.insert(cscoordination, "ou")
	table.insert(cscoordination, "et")
	table.insert(cscoordination, "donc")
	table.insert(cscoordination, "or")
	table.insert(cscoordination, "ni")
	table.insert(cscoordination, "car")
	
	return cscoordination
end
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
-- prépositions >> de, à, vers, près de, chez, devant, dans, sans, contre…
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
function getCSpreposition()
	local cspreposition = {}
	table.insert(cspreposition, "à")
	table.insert(cspreposition, "au")
	table.insert(cspreposition, "après")
	table.insert(cspreposition, "avant")
	table.insert(cspreposition, "dans")
	table.insert(cspreposition, "de")
	table.insert(cspreposition, "du")
	table.insert(cspreposition, "depuis")
	table.insert(cspreposition, "dès")
	table.insert(cspreposition, "en")
	table.insert(cspreposition, "jusque")
	table.insert(cspreposition, "jusqu'à")
	table.insert(cspreposition, "jusqu'en")
	table.insert(cspreposition, "pendant")
	table.insert(cspreposition, "à côté")
	table.insert(cspreposition, "à droite")
	table.insert(cspreposition, "à gauche")
	table.insert(cspreposition, "au-delà")
	table.insert(cspreposition, "au-dessous")
	table.insert(cspreposition, "au-dessus")
	table.insert(cspreposition, "à travers")
	table.insert(cspreposition, "chez")
	table.insert(cspreposition, "contre")
	table.insert(cspreposition, "devant")
	table.insert(cspreposition, "derrière")
	table.insert(cspreposition, "en dehors")
	table.insert(cspreposition, "en face")
	table.insert(cspreposition, "hors")
	table.insert(cspreposition, "loin")
	table.insert(cspreposition, "par")
	table.insert(cspreposition, "près")
	table.insert(cspreposition, "sous")
	table.insert(cspreposition, "sur")
	table.insert(cspreposition, "vers")
	table.insert(cspreposition, "avec")
	table.insert(cspreposition, "d'après")
	table.insert(cspreposition, "entre")
	table.insert(cspreposition, "excepté")
	table.insert(cspreposition, "sauf")
	table.insert(cspreposition, "grâce à")
	table.insert(cspreposition, "malgré")
	table.insert(cspreposition, "parmi")
	table.insert(cspreposition, "pour")
	table.insert(cspreposition, "sans")
	table.insert(cspreposition, "selon")
	table.insert(cspreposition, "près de")
	
	local avecFR = {}
	for i=1, #cspreposition do
		strReform = tostring(cspreposition[i])
		if string.find(strReform, "'") then			
			strReform = string.gsub(strReform, "'", "’")
			table.insert(avecFR, strReform)
		end
	end
	
	for i=1, #avecFR do
		table.insert(cspreposition, avecFR[i])
	end
	
	return cspreposition
end
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
--¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤




-- On créé une fonction pour césurer les sous-titres sans justification du texte
function cesureSansJustification(subs, sel)

	-- Pour chaque lignes sélectionnées :
	for i = 1, #sel do
		-- On récupère l'objet ligne ici appelé "l"
		local l = subs[sel[i]]
		
		-- Si le style de la ligne porte le nom désiré :
		if l.style == "Default" then
			-- On récupère les dimensions du texte
			-- ==============================================================================
			-- mystyle2array(subs, style) récupère ici le tableau style du fichier ASS
			-- portant le nom l.style (contenant donc les paramètres de la police) afin
			-- de calculer les dimensions exactes
			-- ==============================================================================
			-- t1 est ici notre première sous lignes de texte qui a été cast en String
			-- précédament
			-- ==============================================================================
			-- On récupère la valeur de la largeur (width) que l'on met dans une variable
			-- ==============================================================================
			width, height, descent, ext_lead = aegisub.text_extents(mystyle2array(subs, l.style), l.text)
			wMax = width
		
			-- On récupère les valeurs de la vidéo
			xres, yres, ar, artype = aegisub.video_size()
			
			-- On définit une longueur en pourcentage à ne pas dépasser
			-- TODO : Que Kira décide du pourcentage qui s'appliquera à la résolution
			wPercent = xres * 50 / 100
			
			-- On ajoute les césures sans justifier le texte
			str = cesure(wPercent, subs, l.text, l.style, false)
			
			-- On crée la ligne à réimplanter puis on l'assigne au même index
			l.text = str
			subs[sel[i]] = l
		end
	end
	-- On crée une annulation d'effets (si besoin d'annuler les modifications)
	aegisub.set_undo_point("[Kira] Lignes a cesurer (sans justification)")
end

-- On enregistre la fonction "cesureSansJustification" dans le programme afin de pouvoir l'utiliser
-- dans le sous menu d'Automatisation (automation)
aegisub.register_macro("[Kira] Lignes a cesurer (sans justification)", "Cesurer sans se fatiguer (1)", cesureSansJustification)

--==========================================================================================

-- On créé une fonction pour césurer les sous-titres en justifiant le texte (fonction makeJustify ne marche pas)
function cesureAvecJustification(subs, sel)

	-- Pour chaque lignes sélectionnées :
	for i = 1, #sel do
		-- On récupère l'objet ligne ici appelé "l"
		local l = subs[sel[i]]
		
		-- Si le style de la ligne porte le nom désiré :
		if l.style == "Default" then
			-- On récupère les dimensions du texte
			-- ==============================================================================
			-- mystyle2array(subs, style) récupère ici le tableau style du fichier ASS
			-- portant le nom l.style (contenant donc les paramètres de la police) afin
			-- de calculer les dimensions exactes
			-- ==============================================================================
			-- t1 est ici notre première sous lignes de texte qui a été cast en String
			-- précédament
			-- ==============================================================================
			-- On récupère la valeur de la largeur (width) que l'on met dans une variable
			-- ==============================================================================
			width, height, descent, ext_lead = aegisub.text_extents(mystyle2array(subs, l.style), l.text)
			wMax = width
		
			-- On récupère les valeurs de la vidéo
			xres, yres, ar, artype = aegisub.video_size()
			
			-- On définit une longueur en pourcentage à ne pas dépasser
			-- TODO : Que Kira décide du pourcentage qui s'appliquera à la résolution			
			wPercent = xres * 50 / 100
			
			-- aegisub.debug.out(string.format('value : %s \n', file_exists("JInput.jar")))
			-- current_dir=io.popen"cd":read'*l'
			-- aegisub.debug.out(string.format('value : %s \n', current_dir))			
			-- if file_exists("JInput.jar") == true then
				-- wPercent = xres * tonumber(io.popen("java.exe -jar JInput.jar --int"))
			-- end
			
			-- On ajoute les césures avec justification du texte			
			str = cesure(wPercent, subs, l.text, l.style, true)
			
			-- On crée la ligne à réimplanter puis on l'assigne au même index
			l.text = str
			subs[sel[i]] = l
		end
	end
	-- On crée une annulation d'effets (si besoin d'annuler les modifications)
	aegisub.set_undo_point("[Kira] Lignes a cesurer (avec justification)")
end

-- On enregistre la fonction "cesureAvecJustification" dans le programme afin de pouvoir l'utiliser
-- dans le sous menu d'Automatisation (automation)
aegisub.register_macro("[Kira] Lignes a cesurer (avec justification)", "Cesurer sans se fatiguer (2)", cesureAvecJustification)




--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Fonction qui césure une ligne sans ou avec justication 
--============================================================================================
-- widthThreshold >> le seuil maximum de la largeur
-- subs >> l'objet de sous-titres de Aegisub
-- text >> la ligne de texte
-- style >> le nom du style
-- justify >> true -> avec justification du texte
-- justify >> false -> sans justification du texte
--============================================================================================
-- Retourne une chaine césurée
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function cesure(widthThreshold, subs, text, style, justify)
	-- A partir du texte on crée un tableau de césure sur les normes de Kira
	local r = {} ; r = splitOnKey(text)
	
	-- On recrée une chaine qu'on mesure jusqu'à dépasser le seuil (widthThreshold)
	-- On crée une nouvelle ligne pour y entrer les césures
	local oldStr = ""
	local newStr = ""
	local withCesure = ""
	for i = 1, #r do
		-- Test de la chaine avec le nouveau mot
		newStr = newStr .. tostring(r[i])
		
		-- On récupère la largeur de cette chaine test
		width, height, descent, ext_lead = aegisub.text_extents(mystyle2array(subs, style), newStr)
		w = width
		
		-- Si la largeur calculée est supérieure à threshold alors
		-- on ajoute la ligne avant transformation
		-- On ajoute aussi les césures
		if w > widthThreshold then
			if justify == true then
				oldStr = makeJustify(widthThreshold, subs, oldStr, style)
			end
			oldStr = oldStr .. "\\N"
			withCesure = withCesure .. oldStr
			newStr = tostring(r[i])
		end
		
		-- On remplace la valeur de old par new
		oldStr = newStr
	end
	-- S'il reste toujours du monde dans la foule on ajoute à la ligne
	if justify == true then
		newStr = makeJustify(widthThreshold, subs, newStr, style)
	end
	withCesure = withCesure .. newStr
	
	-- On retourne la ligne	
	return withCesure
end

--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Fonction qui cherche la meilleure justication
-- Marche pas (TODO : Passer par le style [créer un nouveau style]) 
--============================================================================================
-- widthThreshold >> le seuil maximum de la largeur
-- subs >> l'objet de sous-titres de Aegisub
-- text >> la ligne de texte
-- style >> le nom du style
--============================================================================================
-- Retourne une chaine justifiée
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function makeJustify(widthThreshold, subs, text, style)
	local wTest = 0 -- Largeur à tester
	local curFsp = 0 -- Espacement des lettres dans le texte
	local curStyleArray = mystyle2array(subs, style) -- Style sur lequel on va faire des essais	
	
	-- Tant que la largeur test est plus petite de threshold :
	while wTest < widthThreshold do
		-- On teste une justification
		curStyleArray.spacing = curFsp
		
		-- On obtient la largeur de cette justification
		width, height, descent, ext_lead = aegisub.text_extents(curStyleArray, text)
		wTest = width
		
		-- On incrémente le font spacing en vu de refaire un test
		curFsp = curFsp + 1
	end
	
	-- Si on arrive la c'est que on est sorti de la boucle donc la valeur n-1 était vrai
	-- On décrémente donc la valeur du font spacing
	curFsp = curFsp - 1
	
	-- On retoure la chaine
	return "{\\fsp" .. curFsp .. "}" .. text .. "{\\r}"
end

--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Fonction qui cherche où césurer
--============================================================================================
-- text >> la ligne de texte
--============================================================================================
-- Retourne un tableau de chaines
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function splitOnKey(text)
	-- On regroupe tous les tableaux en un
	local arrayCS1 = getCSrelative()
	local arrayCS2 = getCScompletive()
	local arrayCS3 = getCScoordination()
	local arrayCS4 = getCSpreposition()
	local arrayCS = {}
	
	-- On crée un méga tableau
	for i=1, #arrayCS1 do
		table.insert(arrayCS, arrayCS1[i])
	end
	for i=1, #arrayCS2 do
		table.insert(arrayCS, arrayCS2[i])
	end
	for i=1, #arrayCS3 do
		table.insert(arrayCS, arrayCS3[i])
	end
	for i=1, #arrayCS4 do
		table.insert(arrayCS, arrayCS4[i])
	end
	
	-- On insère un peu de ponctuation dans un nouveau tableau
	-- Attention >> expressions régulières (regex)
	-- TODO : Vérifier que ça marche avec le regex ou sans
	local ponctuation = {}
	local r = {} -- Bypass
	table.insert(ponctuation, "%. ")
	table.insert(ponctuation, ", ")
	table.insert(ponctuation, "! ")
	table.insert(ponctuation, "%? ")
	table.insert(ponctuation, ": ")
	
	-- On le range du plus long au plus court
	table.sort(arrayCS, function(a,b) return a>b end)
	
	-- On crée le tableau pour les résultats (préselection de lignes)
	local t = {}
	local subSTR = text -- Texte de test
	
	-- On va récréer une chaine et césurer avant mot clé
	for k=1, #arrayCS do
		i, j = string.find(subSTR, tostring(arrayCS[k]))
		if i ~= nil and j ~= nil then
			s = string.sub(subSTR, 1, j)
			table.insert(t, s)
			subSTR = string.sub(subSTR, j+1)
			break
		end
	end
	table.insert(t, subSTR)
	
	-- On reboucle sur les valeurs du tableau pour séparer au niveau de la ponctuation
	for ka=1, #t do
		subSTR = tostring(t[ka])
		for kb=1, #ponctuation do			
			i, j = string.find(subSTR, tostring(ponctuation[kb]))
			if i ~= nil and j ~= nil then
				s = string.sub(subSTR, 1, j-1)
				table.insert(r, s)
				subSTR = string.sub(subSTR, j)
				break
			end
		end
		table.insert(r, subSTR)
	end
	
	return r
end





-- Pour enlever les honorifiques
function antiHonor(subs, sel)
	-- Pour chaque lignes sélectionnées :
	for i = 1, #sel do
		-- On récupère l'objet ligne ici appelé "l"
		local l = subs[sel[i]]
		
		local str = l.text
		
		-- On remplace les honorifiques
		t = {} ; t = getHonor()
		for j=1, #t do
			-- aegisub.debug.out(string.format('str avant : %s \n', str))
			str = string.gsub(str, tostring(t[j]), "")
			-- aegisub.debug.out(string.format('str après : %s \n', str))
		end		
		
		-- On crée la ligne à réimplanter puis on l'assigne au même index
		l.text = str
		subs[sel[i]] = l
	end
	-- On crée une annulation d'effets (si besoin d'annuler les modifications)
	aegisub.set_undo_point("[Chien-Rouge] Enlever les honorifiques")
end

-- On enregistre la fonction "antiHonor" dans le programme afin de pouvoir l'utiliser
-- dans le sous menu d'Automatisation (automation)
aegisub.register_macro("[Chien-Rouge] Enlever les honorifiques", "Enlever les honneurs", antiHonor)



--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-- Crée un tableau de honorifiques
--============================================================================================
-- Retourne un tableau de chaines
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function getHonor()
	t = {}
	table.insert(t, "-san")
	table.insert(t, "-swan")
	table.insert(t, "-chan")
	table.insert(t, "-chwan")
	table.insert(t, "-sama")
	table.insert(t, "-dono")
	table.insert(t, "-sensei")
	table.insert(t, "-senpai")
	table.insert(t, "-senpaï")
	table.insert(t, "-sempai")
	table.insert(t, "-sempaï")
	table.insert(t, "-kouhai")
	table.insert(t, "-kouhaï")
	table.insert(t, "-kun")
	table.insert(t, "-buchō")
	table.insert(t, "-buchô")
	table.insert(t, "-bucho")
	table.insert(t, "-buchou")
	table.insert(t, "-kachō")
	table.insert(t, "-kachô")
	table.insert(t, "-kacho")
	table.insert(t, "-kachou")
	table.insert(t, "-kaichō")
	table.insert(t, "-kaichô")		
	table.insert(t, "-kaicho")
	table.insert(t, "-kaichou")
	table.insert(t, "-shachō")
	table.insert(t, "-shachô")
	table.insert(t, "-shacho")
	table.insert(t, "-shachou")
	return t
end





-- Pour franciser
function reformateur(subs, sel)
	-- Pour chaque lignes sélectionnées :
	for i = 1, #sel do
		-- On récupère l'objet ligne ici appelé "l"
		local l = subs[sel[i]]
		
		local str = l.text
		
		-- On remplace les vilaines choses par des remplacements successifs
		str = string.gsub(str, "oe", "œ") -- Ligature
		str = string.gsub(str, "OE", "Œ") -- Ligature
		str = string.gsub(str, "ae", "æ") -- Ligature
		str = string.gsub(str, "AE", "Æ") -- Ligature
		str = string.gsub(str, "%.%.%.", "…") -- Points de suspension
		
		local expr = ""
		while expr ~= nil do
			k, j = string.find(str, '"[^"]+"')
			expr = string.match(str, '"([^"]+)"')
			reconstruction = ""
			if expr ~= nil then
				reconstruction = string.sub(str, 1, k-1)
				reconstruction = reconstruction .. "« " .. expr .. " »"
				reconstruction = reconstruction .. string.sub(str, j+1)
				-- aegisub.debug.out(string.format('reconstruction : %s \n', reconstruction))
				str = reconstruction
			end
		end
		
		t = {'!','%?',':'}
		for a = 1, #t do
			expr = ""
			while expr ~= nil do
				k, j = string.find(str, '%w' .. tostring(t[a]))
				expr = string.match(str, '(%w)' .. tostring(t[a]))
				reconstruction = ""
				if expr ~= nil then
					reconstruction = string.sub(str, 1, k-1)
					if tostring(t[a]) == "%?" then t[a] = "?" end
					reconstruction = reconstruction .. expr .. " " .. tostring(t[a])
					reconstruction = reconstruction .. string.sub(str, j+1)
					str = reconstruction
				end
			end
		end
		
		-- On crée la ligne à réimplanter puis on l'assigne au même index
		l.text = str
		subs[sel[i]] = l
	end
	-- On crée une annulation d'effets (si besoin d'annuler les modifications)
	aegisub.set_undo_point("[Chien-Rouge] Ligatures, guillemets et plus")
end

-- On enregistre la fonction "reformateur" dans le programme afin de pouvoir l'utiliser
-- dans le sous menu d'Automatisation (automation)
aegisub.register_macro("[Chien-Rouge] Ligatures, guillemets et plus", "MAJ_FRA", reformateur)
