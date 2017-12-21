-- Automation 4
-- Generate CP9 effects

script_name = "[CP9]One Piece"
script_description = "Tous les effets de la team CP9 dans un seul script. Faîtes d'abord un karaoke puis appliquer ceci. ;)"
script_author = "Chien-Rouge"
script_version = "alpha"

include("karaskel-adv.lua")
include("utils.lua")

function OnePieceStyle(subtitles, selected_lines, active_line)
	
	for z, i in ipairs(selected_lines) do
		
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i]
		meta, styles = karaskel.collect_head(subtitles, false)
		karaskel.preproc_line(subtitles, meta, styles, line)
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Monkey D. Luffy
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="gomu gomu no"
		or string.lower(line.text_stripped)=="kane"
		or string.lower(line.text_stripped)=="gatling"
		or string.lower(line.text_stripped)=="twin pistol"
		or string.lower(line.text_stripped)=="pistol"
		or string.lower(line.text_stripped)=="ono"
		or string.lower(line.text_stripped)=="jet whip"
		or string.lower(line.text_stripped)=="mushitori ami"
		or string.lower(line.text_stripped)=="fuusen"
		or string.lower(line.text_stripped)=="stamp"
		or string.lower(line.text_stripped)=="tonkachi" then
			subtitles.append(Luffy_GomuGomuNo(line))
		end
		
		if string.lower(line.text_stripped)=="pistolet"
		or string.lower(line.text_stripped)=="tsuchi"
		or string.lower(line.text_stripped)=="ude"
		or string.lower(line.text_stripped)=="rocket"
		or string.lower(line.text_stripped)=="muchi"
		or string.lower(line.text_stripped)=="bazooka"
		or string.lower(line.text_stripped)=="rifle" then
			subtitles.append(Luffy_Pistolet(line))
		end
		
		if line.text_stripped=="1,000,000 °C Bazooka" then
			subtitles.append(Luffy_MillionDegreesBazooka(line))
		end
		
		if string.lower(line.text_stripped)=="gear second" then
			subtitles.append(Luffy_GearSecond(line))
		end
		
		if string.lower(line.text_stripped)=="jet gatling" then
			Luffy_JetGatling(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="jet pistol" then
			Luffy_JetPistol(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="jet bazooka" then
			Luffy_JetBazooka(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="gear third" then
			subtitles.append(Luffy_Gear_Third(line))
		end
		
		if string.lower(line.text_stripped)=="hone fuusen"
		or string.lower(line.text_stripped)=="gigant axe"
		or string.lower(line.text_stripped)=="gigant pistol" then
			Luffy_Hone_Fuusen(line, subtitles)
		end
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Roronoa Zoro
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="nitouryuu"
		or string.lower(line.text_stripped)=="tora gari" then
			subtitles.append(Zoro_Nitouryuu(line))
		end
		
		if string.lower(line.text_stripped)=="pound hou"
		or string.lower(line.text_stripped)=="hotarubi"
		or string.lower(line.text_stripped)=="hidaruma"
		or string.lower(line.text_stripped)=="nitouryuu nigiri" then
			Zoro_Pound_Hou(line, subtitles)
		end
		
		-- if string.lower(line.text_stripped)=="sanjuu roku pound hou" then
			-- subtitles.append(Zoro_Sanjuuroku_Pound_Hou(line))
		-- end
		
		if string.lower(line.text_stripped)=="hyakuhachi pondo hou"
		or string.lower(line.text_stripped)=="nanajuuni pound hou"	
		or string.lower(line.text_stripped)=="sanjuuroku pound hou"	then
			Zoro_X_Pound_Hou(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="oni giri" then
			Zoro_Oni_Giri(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="ittouryuu"
		or string.lower(line.text_stripped)=="hirameki" then
			Zoro_Ittouryuu(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="santouryuu"
		or string.lower(line.text_stripped)=="dai tetsu giri" then
			Zoro_Santouryuu(line, subtitles)
		end
		
		
		
		-------------------------------------------------------------------------------------------------		
		-- Attaques de Nami
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="thunderbolt tempo"
		or string.lower(line.text_stripped)=="thunder charge"
		or string.lower(line.text_stripped)=="cyclone burst" then
			subtitles.append(Nami_Thunderbolt(line))
		end
		
		if string.lower(line.text_stripped)=="hissatsu"
		or string.lower(line.text_stripped)=="bam bam tornado"
		or string.lower(line.text_stripped)=="thunder ball"
		or string.lower(line.text_stripped)=="heat ball"
		or string.lower(line.text_stripped)=="cool ball" then
			subtitles.append(Nami_Bam_Bam_Tornado(line))
		end
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Usopp
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="hissatsu"
		or string.lower(line.text_stripped)=="chou kemuri boshi"
		or string.lower(line.text_stripped)=="midareuchi salt star"
		or string.lower(line.text_stripped)=="fire bird star"
		or string.lower(line.text_stripped)=="kaen boshi"
		or string.lower(line.text_stripped)=="tabasco boshi"
		or string.lower(line.text_stripped)=="sangekuri"
		or string.lower(line.text_stripped)=="kemuri"
		or string.lower(line.text_stripped)=="rokuren"
		or string.lower(line.text_stripped)=="mamushi boshi"
		or string.lower(line.text_stripped)=="kayaku boshi"
		or string.lower(line.text_stripped)=="kaen hoshi boshi"
		or string.lower(line.text_stripped)=="namari boshi"
		or string.lower(line.text_stripped)=="ussop hammer"
		or string.lower(line.text_stripped)=="hammer"
		or string.lower(line.text_stripped)=="wagomu"
		or string.lower(line.text_stripped)=="boshi"	then
			subtitles.append(Usopp_Boshi(line))
		end
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Sanji
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="collier shoot"
		or string.lower(line.text_stripped)=="concassé"
		or string.lower(line.text_stripped)=="parage shot"
		or string.lower(line.text_stripped)=="concasse" then
			Sanji_Collier_Shoot(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="basses cotes"
		or string.lower(line.text_stripped)=="chasse" then
			Sanji_Chasse(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="collier frit"
		or string.lower(line.text_stripped)=="troisieme hache"
		or string.lower(line.text_stripped)=="tendron" then
			subtitles.append(Sanji_Collier_Frit(line))
		end
		
		if string.lower(line.text_stripped)=="longe"
		or string.lower(line.text_stripped)=="flanchet"
		or string.lower(line.text_stripped)=="quasi"
		or string.lower(line.text_stripped)=="jarret" then
			subtitles.append(Sanji_Flanchet(line))
		end
		
		if string.lower(line.text_stripped)=="oeil"
		or string.lower(line.text_stripped)=="nez"
		or string.lower(line.text_stripped)=="joue"
		or string.lower(line.text_stripped)=="bouche"
		or string.lower(line.text_stripped)=="dents"
		or string.lower(line.text_stripped)=="menton" then
			subtitles.append(Sanji_Menton(line))
		end
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Nico Robin
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="dos fleur"
		or string.lower(line.text_stripped)=="tres fleur"
		or string.lower(line.text_stripped)=="seis fleur"
		or string.lower(line.text_stripped)=="once fleur" 
		or string.lower(line.text_stripped)=="treinta fleur"
		or string.lower(line.text_stripped)=="cien fleur" 
		or string.lower(line.text_stripped)=="dos mano" then
			Robin_X_Fleur(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="wing"
		or string.lower(line.text_stripped)=="slam"
		or string.lower(line.text_stripped)=="clutch"
		or string.lower(line.text_stripped)=="delphinium" 
		or string.lower(line.text_stripped)=="defense"
		or string.lower(line.text_stripped)=="grab" then
			Robin_Delphinium(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="slap"
		or string.lower(line.text_stripped)=="twist" then
			Robin_Slap(line, subtitles)
		end
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Tony Tony Chopper
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="rumble"
		or string.lower(line.text_stripped)=="kokute roseo"
		or string.lower(line.text_stripped)=="kokutei diamond" then
			subtitles.append(Chopper_Rumble(line))
		end
		
		if string.lower(line.text_stripped)=="guard point" then
			subtitles.append(Chopper_Guard_Point(line))
		end
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Francky
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="coup de"
		or string.lower(line.text_stripped)=="vent"
		or string.lower(line.text_stripped)=="burst"
		or string.lower(line.text_stripped)=="boo"
		or string.lower(line.text_stripped)=="heavy nunchaku"
		or string.lower(line.text_stripped)=="hoshi shield"
		or string.lower(line.text_stripped)=="chicken voyage"
		or string.lower(line.text_stripped)=="strong hammer" then
			subtitles.append(Francky_Coup_De(line))
		end
		
		if string.lower(line.text_stripped)=="weapon left"
		or string.lower(line.text_stripped)=="weapons left"
		or string.lower(line.text_stripped)=="fresh fire"		
		or string.lower(line.text_stripped)=="gaon hou"
		or string.lower(line.text_stripped)=="strong right"	then
			Francky_Weapons_Left(line, subtitles)
		end
		
		
		-------------------------------------------------------------------------------------------------
		-- Attaques de Brook
		-------------------------------------------------------------------------------------------------
		if string.lower(line.text_stripped)=="hanauta sanchou"
		or string.lower(line.text_stripped)=="yahazu giri" 
		or string.lower(line.text_stripped)=="nemuriuta" then
			Brook_Yahazu_Giri(line, subtitles)
		end
		
		
		-- Attaques de Alvida
		-- Attaques de Buggy
		-- Attaques de Cabaji
		-- Attaques de Moji
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Thriller Bark - Perona
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="negative hollow" then
			Thriller_Bark_Perona_Negative_Hollow(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="negative hollows" then
			Thriller_Bark_Perona_Negative_Hollows(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Arlong Park - Hachi
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="tako hachi black"
		or string.lower(line.text_stripped)=="takoyaki punch" 
		or string.lower(line.text_stripped)=="tako ashi kiken" then
			Arlong_Park_Hachi_Tako_Hachi(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="rokutouryuu" then
			Arlong_Park_Hachi_Rokutouryu(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Saboady / Amazon Lily / Inpel Dawn - Boa Hancok
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="mero mero mellow"
		or string.lower(line.text_stripped)=="slave arrow"
		or string.lower(line.text_stripped)=="perfume femur" then
			Amazon_Lily_Hancok_Mero_Mero(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Saboady / Amazon Lily - Sonia
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="hebi slam"
		or string.lower(line.text_stripped)=="snake dance" then
			Amazon_Lily_Sonia_Hebi_Slam(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="hebigami tsuki" and string.lower(line.actor)=="sonia"
		or string.lower(line.text_stripped)=="yamata no orochi" then
			Amazon_Lily_Sonia_Hebigami_Tsuki(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Saboady / Amazon Lily - Marie
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="hebi stick" then
			Amazon_Lily_Marie_Hebi_Stick(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="hebigami tsuki" and string.lower(line.actor)=="marie"
		or string.lower(line.text_stripped)=="salamander" then
			Amazon_Lily_Marie_Hebigami_Tsuki(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Saboady - Le gros tas avec le symbole de sharingan et les cordes dans le dos à la orochimaru (trouver le nom)
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="ashigara dokkoi" then
			Saboady_GrosTas_Ashigara(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Buggy - Buggy
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="bara bara kinkyuu dasshutsu"
		or string.lower(line.text_stripped)=="bara bara"
		or string.lower(line.text_stripped)=="hou" then
			Buggy_Bara_Bara_Kinkyuu_Dasshutsu(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="senbei" then
			Buggy_Senbei(line, subtitles)
		end
		
		if string.lower(line.text_stripped)=="kuuchuu kirimomi dai circus" then
			Buggy_Kuuchuu_Kirimomi_Dai_Circus(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Baroque Works - Mr. 3
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="candle lock"
		or string.lower(line.text_stripped)=="candle"
		or string.lower(line.text_stripped)=="lock" then
			Mr3_Candle(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- ARC Baroque Works - Mr. 2 - Bon Clay
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="hakuchou arabesque" then
			Mr2_Hakuchou(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- Pirates de Barbe Blanche - Portgas D. Ace
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="enjou mou" then
			Ace_Fort(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- Marines - Aokiji
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="ice age"
		or string.lower(line.text_stripped)=="partisan" then
			Aokiji_Glace(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- Marines - Kizaru
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="yasakani no magatama" then
			Kizaru_Simple(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- Marines - Akainu
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="dai funka"
		or string.lower(line.text_stripped)=="ryuusei kazan" then
			Akainu_Simple(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- Shichibukai - Bartholomew Kuma
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="ursus shock" then
			Kuma_Ursus(line, subtitles)
		end
		
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- Shichibukai - Gecko Moria
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if string.lower(line.text_stripped)=="doppelman" then
			Moria_Doppelman(line, subtitles)
		end
		if string.lower(line.text_stripped)=="tsuno tokage" then
			Moria_TsunoTokage(line, subtitles)
		end
		
		--============================================================================
		-- One Piece JIKAI O TANOSHIMI NI
		--============================================================================
		if string.lower(line.actor)=="jikai o tanoshimi ni" then
			line.actor = ""
			line.style = "Default"
			line.text = "{\\an4\\pos(255,683)}Vivement le prochain épisode !!"
			subtitles[i] = line
		end
		
		-- Test output
		-- local newline = "Ceci est un test."
		--line.text = newline
		--subtitles.append(line)
		
		-- Cette ligne permet d'ajouter une ligne en bas de tableau
		--subtitles.append(l)
	end
	
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("Effets [CP9]One Piece")
	
end

-- ======================================================================================================================================
--- FONCTIONS SUPPLEMENTAIRES ---------------------------------------------------------------------------------------------------------------------------------------------------------
-- ======================================================================================================================================

-- Fonction formatline(Line line, String text, String style)
function formatline(line, text, style)
	line.comment = false				-- On force la ligne en dialogue
	line.actor = ""						-- On efface le texte de nom (pouvant aider dans la reconnaissance des effets)
	line.style = style					-- On inscrit le style pour l'effet (assurant que l'effet soit bien formaté). Le style doit exister.
	line.text = text					-- On modifie le texte (nouveau texte)
	return line							-- On retourne la nouvelle valeur de la ligne
end

-- Fonction beforeline(Line line, String text, String style, Integer ms) -- Permet d'ajouter un sous-titre juste avant un autre.
function beforeline(line, text, style, ms)
	line = formatline(line, text, style)
	line.end_time = line.start_time
	line.start_time = line.end_time - ms
	return line
end

-- Fonction afterline(Line line, String text, String style, Integer ms) -- Permet d'ajouter un sous-titre juste après un autre.
function afterline(line, text, style, ms)
	line = formatline(line, text, style)
	line.start_time = line.end_time
	line.end_time = line.start_time + ms
	return line
end

-- Fonction resizeline(Line line, String text, String style, Integer ms) -- Permet de redimensionner un sous-titre.
function resizeline(line, text, style, startms, endms)
	line = formatline(line, text, style)
	if startms > 0 then line.start_time = startms end
	if endms > 0 then line.end_time = endms end
	return line
end

-- Fonction resetlinetime(Line line, Integer startms, Integer endms) -- Redéfini les temps (car la ligne s'est modifiée au cours du script)
function resetlinetime(line, startms, endms)
	line.start_time = startms
	line.end_time = endms
	return line
end

-- Fonction -- Renvoie les couleurs intermédiaires en dégradé
function layercolor(firstcolor, secondcolor, subdivisions)
	-- On va commencer à n=0, on veut donc n-1 valeurs (voir boucle while)
	subdivisions = subdivisions - 1

	-- Obtient les couleurs à partir de leur forma ASS - ex : &HFFFFFF&
	r1, g1, b1, a1 = extract_color(firstcolor)
	r2, g2, b2, a2 = extract_color(secondcolor)
	-- aegisub.debug.out(string.format('Processing line %d: "%s"\n', i, l.text))
	-- aegisub.debug.out(string.format('First color (RED) : %d \n', r1))	
	-- aegisub.debug.out(string.format('First color (GREEN) : %d \n', g1))
	-- aegisub.debug.out(string.format('First color (BLUE) : %d \n', b1))
	-- aegisub.debug.out(string.format('Second color (RED) : %d \n', r2))
	-- aegisub.debug.out(string.format('Second color (GREEN) : %d \n', g2))
	-- aegisub.debug.out(string.format('Second color (BLUE) : %d \n', b2))
	
	-- Calcule la différence
	rdiff = r2-r1
	gdiff = g2-g1
	bdiff = b2-b1
	-- aegisub.debug.out(string.format('Diff color (RED) : %d \n', rdiff))
	-- aegisub.debug.out(string.format('Diff color (GREEN) : %d \n', gdiff))
	-- aegisub.debug.out(string.format('Diff color (BLUE) : %d \n', bdiff))
	
	-- Calcule le delta dû à la subdivision
	rdelta = rdiff/subdivisions
	gdelta = gdiff/subdivisions
	bdelta = bdiff/subdivisions
	-- aegisub.debug.out(string.format('Delta color (RED) : %d \n', rdelta))
	-- aegisub.debug.out(string.format('Delta color (GREEN) : %d \n', gdelta))
	-- aegisub.debug.out(string.format('Delta color (BLUE) : %d \n', bdelta))
	
	-- Crée un tableau pour retourner des couleurs intermédiaires
	degrade = {}
	
	-- Pour toutes les subdivisions voulues, on obtient une couleur et on la met directement dans le tableau
	i = 0
	while i <= subdivisions do
		r = r1+(rdelta*i)
		g = g1+(gdelta*i)
		b = b1+(bdelta*i)
		-- aegisub.debug.out(string.format('InWhile color (RED) : %d \n', r))
		-- aegisub.debug.out(string.format('InWhile color (GREEN) : %d \n', g))
		-- aegisub.debug.out(string.format('InWhile color (BLUE) : %d \n', b))
		
		degrade[i+1] = ass_color(r,g,b)
		-- aegisub.debug.out(string.format('InWhile color (STRING) : %s \n', ass_color(r,g,b)))
		
		i = i+1
	end
	
	-- On retourne le tableau
	return degrade
end

function invertcolor(color)
	-- Obtient les couleurs à partir de leur forma ASS - ex : &HFFFFFF&
	r, g, b, a = extract_color(color)
	nr = 255 - r
	ng = 255 - g
	nb = 255 - b
	a = 255 - a
	return ass_color(nr,ng,nb)
end

-- Compatibility: Lua-5.1 -- http://lua-users.org/wiki/SplitJoin
function split(str, pat)
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

-- Fonction -- Renvoie les transparences intermédiaires en dégradé
function layeralpha(firstalpha, secondalpha, subdivisions)
	-- On va commencer à n=0, on veut donc n-1 valeurs (voir boucle while)
	subdivisions = subdivisions - 1
	
	-- Obtient les couleurs à partir de leur forma ASS - ex : &HFFFFFF&
	r1, g1, b1, a1 = extract_color(firstalpha)
	r2, g2, b2, a2 = extract_color(secondalpha)

	-- Calcule la différence
	alphadiff = a2-a1
	
	-- Calcule le delta dû à la subdivision
	alphadelta = alphadiff/subdivisions
	
	-- Crée un tableau pour retourner des couleurs intermédiaires
	degrade = {}
	
	-- Pour toutes les subdivisions voulues, on obtient une couleur et on la met directement dans le tableau
	i = 0
	while i <= subdivisions do
		alpha = a1+(alphadelta*i)
		
		degrade[i+1] = ass_alpha(alpha)
		-- aegisub.debug.out(string.format('InWhile color (STRING) : %s \n', ass_color(r,g,b)))
		
		i = i+1
	end
	
	-- On retourne le tableau
	return degrade
end

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- #########################################################################################
-- ### Attaques de Monkey D. Luffy
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction GomuGomuNo
	-- S'applique à :
	--	GO|MU |GO|MU |NO 			KA|NE				GA|T|LING
	--	TWIN |PIS|TOL				PIS|TOL				O|NO
	--	JET |WHIP					FUU|SE|N
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)
	-- Sur chaque syllabe : \t(sylStart,sylMiddle,\fs80)\t(sylMiddle,sylEnd,\fs45)
	-----------------------------------------------------------------------
	function Luffy_GomuGomuNo(karaline)
		local temp = ""
		local newline = "{\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fs80)\\t(%d,%d,\\fs45)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		karaline.comment = false
		karaline.style = "luffy"
		karaline.actor = ""
		karaline.text = newline
		return karaline
	end

	-----------------------------------------------------------------------
	-- Fonction Pistolet
	-- S'applique à :
	--	PISTOLET		 			TSUCHI				UDE
	--	ROCKET					MUCHI				BAZOOKA
	--	JET PISTOL				
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)\t(0,1400,\3a&HFFFFFF&\4a&HFFFFFF&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Luffy_Pistolet(karaline)
		local newline = "{\\pos(320,460)\\t(0,1400,\\3a&HFFFFFF&\\4a&HFFFFFF&)}" .. karaline.text_stripped
		return formatline(karaline, newline, "luffy")
	end

	-----------------------------------------------------------------------
	-- Fonction MillionDegreesBazooka
	-- S'applique à :
	--	1,000,000°C BAZOOKA
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)\t(0,3200,\3a&HFFFFFF&\4a&HFFFFFF&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Luffy_MillionDegreesBazooka(karaline)
		local newline = "{\\pos(320,460)\\t(0,3200,\\3a&HFFFFFF&\\4a&HFFFFFF&)}" .. karaline.text_stripped
		return formatline(karaline, newline, "luffy")
	end

	-----------------------------------------------------------------------
	-- Fonction GearSecond
	-- S'applique à :
	--	GEAR SECOND
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)\1a&H1A1B92&&\3a&H1A1B92&\bord3\4c&HCDF7FE&\t(160,161,\bord10)\t(160,1660,\4c&H082F93&)
	--		\t(160,260,\shad20)\t(260,360,\shad5)\t(360,460,\shad20)\t(360,460,\shad5)\t(460,560,\shad20)\t(560,660,\shad20)
	--		\t(660,760,\shad5)\t(760,860,\shad20)\t(860,960,\shad5)\t(960,1060,\shad20)\t(1060,1160,\shad5)\t(1160,1260,\shad20)
	--		\t(1260,1360,\shad5)\t(1360,1460,\shad20)\t(1360,1460,\shad5)\t(1460,1560,\shad20)\t(1560,1660,\shad0\bord0)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Luffy_GearSecond(karaline)
		local a = "{\\pos(320,460)\\1a&H1A1B92&&\\3a&H1A1B92&\\bord3\\4c&HCDF7FE&\\t(160,161,\\bord10)\\t(160,1660,\\4c&H082F93&)"
		.. "\\t(160,260,\\shad20)\\t(260,360,\\shad5)\\t(360,460,\\shad20)\\t(360,460,\\shad5)\\t(460,560,\\shad20)\\t(560,660,\\shad20)"
		.. "\\t(660,760,\\shad5)\\t(760,860,\\shad20)\\t(860,960,\\shad5)\\t(960,1060,\\shad20)\\t(1060,1160,\\shad5)\\t(1160,1260,\\shad20)"
		.. "\\t(1260,1360,\\shad5)\\t(1360,1460,\\shad20)\\t(1360,1460,\\shad5)\\t(1460,1560,\\shad20)\\t(1560,1660,\\shad0\\bord0)}"
		local newline = a .. karaline.text_stripped
		return formatline(karaline, newline, "luffy")
	end

	----------------------------------------------------------------------- ATTENTION : Jet Gatling doit être karaoke sur une ligne en entrée comme ceci : {\k20}Jet {\k20}{\k20}Gatling
	-- Fonction Jet Gatling
	-- S'applique à :
	--	JET GATLING
	-----------------------------------------------------------------------
	-- Dialogue: 0,0:03:35.85,0:03:37.61,luffy,Luffy,0000,0000,0000,,{\org(322,10)\t(60,970,\fry-360)\t(60,500,\fscx200\fscy50)\t(500,970,\fscx100\fscy100)\be1}Jet
	-- Dialogue: 0,0:03:38.64,0:03:41.64,luffy,Luffy,0000,0000,0000,,{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}G{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}a{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}t{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}l{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}i{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}n{\r\be1\t(0,100,\fs60)\t(100,200,\fs40)\t(200,300,\fs60)\t(300,400,\fs40)\t(400,500,\fs60)\t(500,600,\fs40)\t(600,700,\fs60)\t(700,800,\fs40)\t(800,900,\fs60)\t(900,1000,\fs40)\t(1000,1100,\fs60)\t(1100,1200,\fs40)\t(1200,1300,\fs60)\t(1300,1400,\fs40)\t(1400,1500,\fs60)\t(1500,1600,\fs40)\t(1600,1700,\fs60)\t(1700,1800,\fs40)\t(1800,1900,\fs60)\t(1900,2000,\fs40)\t(2000,2100,\fs40)\t(2100,2200,\fs60)\t(2200,2300,\fs40)\t(2300,2400,\fs60)\t(2400,2500,\fs40)\t(2500,2600,\fs60)\t(2600,2700,\fs40)\t(2700,2800,\fs60)\t(2800,2900,\fs40)\t(2900,3000,\fs60)}g
	-- Dialogue: 0,0:03:41.64,0:03:43.02,luffy,Luffy,0000,0000,0000,,{\org(322,10)\t(60,970,\fry-360)\t(60,500,\fscx200\fscy50)\t(500,970,\fscx0\fscy0)\be1}Gatling
	-----------------------------------------------------------------------
	function Luffy_JetGatling(karaline, subtitles)
		local debut = karaline.start_time			-- On garde en mémoire le début
		local fin = karaline.end_time				-- On garde en mémoire la fin
		local a = "{\\org(322,10)\\t(60,970,\\fry-360)\\t(60,500,\\fscx200\\fscy50)\\t(500,970,\\fscx100\\fscy100)\\be1}"
		local b = "{\\r\\be1\\t(0,100,\\fs60)\\t(100,200,\\fs40)\\t(200,300,\\fs60)\\t(300,400,\\fs40)\\t(400,500,\\fs60)"
		.. "\\t(500,600,\\fs40)\\t(600,700,\\fs60)\\t(700,800,\\fs40)\\t(800,900,\\fs60)\\t(900,1000,\\fs40)\\t(1000,1100,\\fs60)"
		.. "\\t(1100,1200,\\fs40)\\t(1200,1300,\\fs60)\\t(1300,1400,\\fs40)\\t(1400,1500,\\fs60)\\t(1500,1600,\\fs40)"
		.. "\\t(1600,1700,\\fs60)\\t(1700,1800,\\fs40)\\t(1800,1900,\\fs60)\\t(1900,2000,\\fs40)\\t(2000,2100,\\fs40)"
		.. "\\t(2100,2200,\\fs60)\\t(2200,2300,\\fs40)\\t(2300,2400,\\fs60)\\t(2400,2500,\\fs40)\\t(2500,2600,\\fs60)"
		.. "\\t(2600,2700,\\fs40)\\t(2700,2800,\\fs60)\\t(2800,2900,\\fs40)\\t(2900,3000,\\fs60)}"
		local c = "{\\org(322,10)\\t(60,970,\\fry-360)\\t(60,500,\\fscx200\\fscy50)\\t(500,970,\\fscx0\\fscy0)\\be1}"
		local newline = a .. karaline.text_stripped
		local syl_one = karaline.kara[1]			-- On récupère la valeur de Jet
		local syl_thr = karaline.kara[3]			-- On récupère la valeur de Gatling
		
		-- Première ligne : début = line.start_time ; fin = line.start_time + syl_one.duration -- texte = a + Jet
		subtitles.append(resizeline(karaline, a .. syl_one.text_stripped, "luffy", 0, debut + syl_one.duration))
		karaline = resetlinetime(karaline, debut, fin) -- Ce reset est necessaire car on veut calculer dans des conditions normales
		
		subtitles.append(resizeline(karaline, c .. syl_thr.text_stripped, "luffy", fin - syl_thr.duration, fin))
		-- Ici pas de resetlinetime(karaline, debut, fin) car on veut calculer dans les dernière conditions (ligne de Gatling quand Luffy crie)
		
		newline = ""
		i = 1
		while i <= string.len(syl_thr.text) do
			newline = newline .. b .. string.sub(syl_thr.text, i , i)
			i = i + 1
		end
		
		-- Si Jet est séparé du mot suivant par plus de 3000ms alors :
		if debut + syl_one.duration < fin - syl_thr.duration - 3000 then
			subtitles.append(beforeline(karaline, newline, "luffy", 3000))
		else
			subtitles.append(resizeline(karaline, newline, "luffy", debut + syl_one.duration, fin - syl_thr.duration))
		end
		
	end
	
	function Luffy_JetBazooka(karaline, subtitles)
		local debut = karaline.start_time			-- On garde en mémoire le début
		local fin = karaline.end_time				-- On garde en mémoire la fin
		local a = "{\\org(322,10)\\t(60,970,\\fry-360)\\t(60,500,\\fscx200\\fscy50)\\t(500,970,\\fscx100\\fscy100)\\be1}"
		local b = "{\\r\\be1\\t(0,100,\\fs60)\\t(100,200,\\fs40)\\t(200,300,\\fs60)\\t(300,400,\\fs40)\\t(400,500,\\fs60)"
		.. "\\t(500,600,\\fs40)\\t(600,700,\\fs60)\\t(700,800,\\fs40)\\t(800,900,\\fs60)\\t(900,1000,\\fs40)\\t(1000,1100,\\fs60)"
		.. "\\t(1100,1200,\\fs40)\\t(1200,1300,\\fs60)\\t(1300,1400,\\fs40)\\t(1400,1500,\\fs60)\\t(1500,1600,\\fs40)"
		.. "\\t(1600,1700,\\fs60)\\t(1700,1800,\\fs40)\\t(1800,1900,\\fs60)\\t(1900,2000,\\fs40)\\t(2000,2100,\\fs40)"
		.. "\\t(2100,2200,\\fs60)\\t(2200,2300,\\fs40)\\t(2300,2400,\\fs60)\\t(2400,2500,\\fs40)\\t(2500,2600,\\fs60)"
		.. "\\t(2600,2700,\\fs40)\\t(2700,2800,\\fs60)\\t(2800,2900,\\fs40)\\t(2900,3000,\\fs60)}"
		local c = "{\\pos(320,460)\\t(0,1400,\\3a&HFFFFFF&\\4a&HFFFFFF&)\\t(0,100,\\1c&HFFFFFF&)\\t(100,200,\\1c&H1A1B92&)"
		.. "\\t(200,300,\\1c&HFFFFFF&)\\t(300,400,\\1c&H1A1B92&)\\t(400,500,\\1c&HFFFFFF&)\\t(500,600,\\1c&H1A1B92&)"
		.. "\\t(600,700,\\1c&HFFFFFF&)\\t(700,800,\\1c&H1A1B92&)\\t(800,900,\\1c&HFFFFFF&)\\t(900,1000,\\1c&H1A1B92&)"
		.. "\\t(1000,1100,\\1c&HFFFFFF&)\\t(1100,1200,\\1c&H1A1B92&)\\t(1200,1300,\\1c&HFFFFFF&)\\t(1300,1400,\\1c&H1A1B92&)"
		.. "\\t(\\alpha&HFF&\\fscx150\\fscy150\\bord10\\be1\\blur10)}"
		local newline = a .. karaline.text_stripped
		local syl_one = karaline.kara[1]			-- On récupère la valeur de Jet
		local syl_thr = karaline.kara[3]			-- On récupère la valeur de Gatling
		
		-- Première ligne : début = line.start_time ; fin = line.start_time + syl_one.duration -- texte = a + Jet
		subtitles.append(resizeline(karaline, a .. syl_one.text_stripped, "luffy", 0, debut + syl_one.duration))
		karaline = resetlinetime(karaline, debut, fin) -- Ce reset est necessaire car on veut calculer dans des conditions normales
		
		subtitles.append(resizeline(karaline, c .. syl_thr.text_stripped, "luffy", fin - syl_thr.duration, fin))
		-- Ici pas de resetlinetime(karaline, debut, fin) car on veut calculer dans les dernière conditions (ligne de Gatling quand Luffy crie)
		
		newline = ""
		i = 1
		while i <= string.len(syl_thr.text) do
			newline = newline .. b .. string.sub(syl_thr.text, i , i)
			i = i + 1
		end
		
		-- Si Jet est séparé du mot suivant par plus de 3000ms alors :
		if debut + syl_one.duration < fin - syl_thr.duration - 3000 then
			subtitles.append(beforeline(karaline, newline, "luffy", 3000))
		else
			subtitles.append(resizeline(karaline, newline, "luffy", debut + syl_one.duration, fin - syl_thr.duration))
		end
		
	end
	
	function Luffy_JetPistol(karaline, subtitles)
		local debut = karaline.start_time			-- On garde en mémoire le début
		local fin = karaline.end_time				-- On garde en mémoire la fin
		local a = "{\\pos(320,460)\\t(0,1400,\\3a&HFFFFFF&\\4a&HFFFFFF&)}"
		local b = "{\\r\\be1\\t(0,100,\\fs60)\\t(100,200,\\fs40)\\t(200,300,\\fs60)\\t(300,400,\\fs40)\\t(400,500,\\fs60)"
		.. "\\t(500,600,\\fs40)\\t(600,700,\\fs60)\\t(700,800,\\fs40)\\t(800,900,\\fs60)\\t(900,1000,\\fs40)\\t(1000,1100,\\fs60)"
		.. "\\t(1100,1200,\\fs40)\\t(1200,1300,\\fs60)\\t(1300,1400,\\fs40)\\t(1400,1500,\\fs60)\\t(1500,1600,\\fs40)"
		.. "\\t(1600,1700,\\fs60)\\t(1700,1800,\\fs40)\\t(1800,1900,\\fs60)\\t(1900,2000,\\fs40)\\t(2000,2100,\\fs40)"
		.. "\\t(2100,2200,\\fs60)\\t(2200,2300,\\fs40)\\t(2300,2400,\\fs60)\\t(2400,2500,\\fs40)\\t(2500,2600,\\fs60)"
		.. "\\t(2600,2700,\\fs40)\\t(2700,2800,\\fs60)\\t(2800,2900,\\fs40)\\t(2900,3000,\\fs60)}"
		local c = "{\\pos(320,460)\\t(0,1400,\\3a&HFFFFFF&\\4a&HFFFFFF&)}"
		local newline = a .. karaline.text_stripped
		local syl_one = karaline.kara[1]			-- On récupère la valeur de Jet
		local syl_thr = karaline.kara[3]			-- On récupère la valeur de Gatling
		
		-- Première ligne : début = line.start_time ; fin = line.start_time + syl_one.duration -- texte = a + Jet
		subtitles.append(resizeline(karaline, a .. syl_one.text_stripped, "luffy", 0, debut + syl_one.duration))
		karaline = resetlinetime(karaline, debut, fin) -- Ce reset est necessaire car on veut calculer dans des conditions normales
		
		subtitles.append(resizeline(karaline, c .. syl_thr.text_stripped, "luffy", fin - syl_thr.duration, fin))
		-- Ici pas de resetlinetime(karaline, debut, fin) car on veut calculer dans les dernière conditions (ligne de Gatling quand Luffy crie)
		
		newline = ""
		i = 1
		while i <= string.len(syl_thr.text) do
			newline = newline .. b .. string.sub(syl_thr.text, i , i)
			i = i + 1
		end
		
		-- Si Jet est séparé du mot suivant par plus de 3000ms alors :
		if debut + syl_one.duration < fin - syl_thr.duration - 3000 then
			subtitles.append(beforeline(karaline, newline, "luffy", 3000))
		else
			subtitles.append(resizeline(karaline, newline, "luffy", debut + syl_one.duration, fin - syl_thr.duration))
		end
		
	end
	
	-----------------------------------------------------------------------
	-- Fonction Bam_Bam_Tornado			S'applique à :		His|sa|tsu, Bam |Bam | Tor|na|do, Thunder |Ball, 
	-----------------------------------------------------------------------
	-- Surcharge : <rien>
	-- Sur chaque syllabe : \r\t(0,390,\fscy50\fscy100\bord5\bord2\1c&HFFFFFF&\be1)
	-----------------------------------------------------------------------
	function Luffy_Gear_Third(karaline)
		local temp = ""
		local newline = ""
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscy130\\fscy80\\bord2\\bord5\\1c&H00CCFF\\3c&HFFFFFF&\\be1)}%s", syl.start_time, syl.end_time, syl.text_stripped)
			newline = newline .. temp
		end
		return formatline(karaline, newline, "luffy")
	end
	
	-----------------------------------------------------------------------
	-- Fonction Bam_Bam_Tornado			S'applique à :		His|sa|tsu, Bam |Bam | Tor|na|do, Thunder |Ball, 
	-----------------------------------------------------------------------
	-- Surcharge : <rien>
	-- Sur chaque syllabe : \r\t(0,390,\fscy50\fscy100\bord5\bord2\1c&HFFFFFF&\be1)
	-----------------------------------------------------------------------
	function Luffy_Hone_Fuusen(karaline, subtitles)
		local temp = ""
		local newline = "{\\org(-10000,460)\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\t(%d,%d,\\fscy130\\fscy80\\bord2\\bord5\\1c&H00CCFF\\3c&HFFFFFF&\\be1)}%s", syl.start_time, syl.end_time, syl.text_stripped)
			newline = newline .. "{\\r\\t(0,50,\\frz0.02)\\t(50,100,\\frz-0.02)\\t(100,150,\\frz0.02)" 
		.. "\\t(150,200,\\frz-0.02)\\t(200,250,\\frz0.02)\\t(250,300,\\frz-0.02)\\t(300,350,\\frz0.02)\\t(350,400,\\frz-0.02)" 
		.. "\\t(400,450,\\frz0.02)\\t(450,500,\\frz-0.02)\\t(500,550,\\frz0.02)\\t(550,600,\\frz-0.02)\\t(600,650,\\frz0.02)" 
		.. "\\t(650,700,\\frz-0.02)\\t(700,750,\\frz0.02)\\t(750,800,\\frz-0.02)\\t(800,850,\\frz0.02)\\t(850,900,\\frz-0.02)"
		.. "\\t(900,950,\\frz0.04)\\t(950,1000,\\frz-0.04)\\t(1000,1050,\\frz0.08)\\t(1050,1100,\\frz-0.08)\\t(1100,1150,\\frz0.12)"
		.. "\\t(1150,1200,\\frz-0.12)\\t(1200,1250,\\frz0.16)\\t(1250,1300,\\frz-0.16)\\t(1300,1350,0.5,\\frz0)}" .. temp
		end
		subtitles.append(formatline(karaline, newline, "luffy"))
	end
	


-- #########################################################################################
-- ### Attaques de Roronoa Zoro
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction Nitouryuu
	-- S'applique à :
	--	NITOURYUU				TORA GARI
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)}{\t(1200,1410,\fry1440,\alpha&HFF&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Zoro_Nitouryuu(karaline)
		local newline = "{\\pos(320,460)\\t(1200,1410,\\fry1440\\alpha&HFF&)}" .. karaline.text_stripped
		return formatline(karaline, newline, "Zoro")
	end

	-----------------------------------------------------------------------
	-- Fonction Pound_Hou
	-- S'applique à :
	--	POUND HOU				HOTARUBI					HIDARUMA
	--	NANAJUUNI POUND HOU
	-----------------------------------------------------------------------
	-- Surcharge [couche 1 et 2] : \pos(320,460)\t(1610,1880,\fry1440,\alpha&HFF&)
	-- Surcharge [couche 3] : \3a&HFF&\4a&HFF&\pos(320,460)\clip(0,0,241,480)\t(0,195,\clip(0,0,397,480)\t(205,400,\clip(0,0,241,480)
	--			\t(400,595,\clip(0,0,397,480)\t(605,800,\clip(0,0,241,480)\t(800,995,\clip(0,0,397,480)\t(1005,1200,\clip(0,0,241,480)
	-- Surcharge [couche 4] : \3a&HFF&\4a&HFF&\pos(320,460)\clip(0,0,241,480)\t(5,200,\clip(0,0,397,480)\t(200,395,\clip(0,0,241,480)
	--			\t(405,600,\clip(0,0,397,480)\t(600,795,\clip(0,0,241,480)\t(805,1000,\clip(0,0,397,480)\t(1000,1195,\clip(0,0,241,480)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Zoro_Pound_Hou(karaline, subtitles)
		local c12 = "{\\pos(320,460)\\t(1610,1880,\\fry1440,\\alpha&HFF&)}"
		local c3 = "{\\3a&HFF&\\4a&HFF&\\pos(320,460)\\clip(0,0,241,480)\\t(0,195,\\clip(0,0,397,480)\\t(205,400,\\clip(0,0,241,480)"
		.. "\\t(400,595,\\clip(0,0,397,480)\\t(605,800,\\clip(0,0,241,480)\\t(800,995,\\clip(0,0,397,480)\\t(1005,1200,\\clip(0,0,241,480)}"
		local c4 = "{\\3a&HFF&\\4a&HFF&\\pos(320,460)\\clip(0,0,241,480)\\t(5,200,\\clip(0,0,397,480)\\t(200,395,\\clip(0,0,241,480)"
		.. "\\t(405,600,\\clip(0,0,397,480)\\t(600,795,\\clip(0,0,241,480)\\t(805,1000,\\clip(0,0,397,480)\\t(1000,1195,\\clip(0,0,241,480)}"
		karaline.comment = false
		karaline.actor = ""
		
		karaline.style = "Zoro 2"
		karaline.layer = 1
		karaline.text = c12 .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 1
		
		karaline.style = "Zoro"
		karaline.layer = 2
		karaline.text = c12 .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 2
		
		karaline.style = "Zoro 3"
		karaline.layer = 3
		karaline.text = c3 .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 3
		
		karaline.style = "Zoro"
		karaline.layer = 4
		karaline.text = c4 .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 4
	end

	-----------------------------------------------------------------------
	-- Fonction Sanjuuroku_Pound_Hou		S'applique à :		SANJUU ROKU POUND HOU, 
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)}{\t(1200,1410,\fry1440,\alpha&HFF&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Zoro_Sanjuuroku_Pound_Hou(karaline)
		local newline = "{\\pos(320,460)}{\\t(1200,1410,\\fry1440,\\alpha&HFF&)}" .. karaline.text_stripped
		return formatline(karaline, newline, "Zoro 4")
	end
	
	-----------------------------------------------------------------------
	-- Fonction X_Pound_Hou		S'applique à :		SANJUU ROKU POUND HOU,  HYAKUHACHI POUND HOU
	-- Ceci est une nouvelle technique pour tous les pound hou avec plus d'un coup, elle remplace celle de KuRo et est plus spectaculaire.
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Zoro_X_Pound_Hou(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		
		karaline.style = "Zoro"
		karaline.layer = 1
		karaline.text = "{\\pos(320,460)}" .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 1
		
		karaline.style = "Zoro 3"
		karaline.layer = 2
		karaline.text = "{\\pos(320,460)\\3c&HFFFFCC&\\blur10\\be1\\clip(150,0,160,480)\\t(\\clip(490,0,500,480))}" .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 2
		
		karaline.style = "Zoro 3"
		karaline.layer = 3
		
		i = 0
		while i <= 10 do
			karaline.text = "{\\alpha&HFF&\\t(0,1000,\\1a&H7F&\\3a&H00&)\\t(1000,2000,\\1a&HFF&\\3a&HFF&))\\move(165,460,505,460," .. 0+10*i .. "," .. karaline.duration+10*i .. ")\\org(-10000,450)\\fnTimes New Roman\\fscx200\\fscy200\\1c&HFFFFCC&\\3c&HFFFFCC&\\blur10\\be1\\t(" .. 0+i .. "," .. 200+i .. ",\\frz0.08)\\t(" .. 200+i .. "," .. 400+i .. ",\\frz0)\\t(" .. 400+i .. "," .. 600+i .. ",\\frz-0.08)\\t(" .. 600+i .. "," .. 800+i .. ",\\frz0)\\t(" .. 800+i .. "," .. 1000+i .. ",\\frz0.08)\\t(" .. 1000+i .. "," .. 1200+i .. ",\\frz0)\\t(" .. 1200+i .. "," .. 1400+i .. ",\\frz-0.08)\\t(" .. 1400+i .. "," .. 1600+i .. ",\\frz0)\\t(" .. 1600+i .. "," .. 1800+i .. ",\\frz0.08)\\t(" .. 1800+i .. "," .. 2000+i .. ",\\frz0)}" .. "."
			subtitles.append(karaline) -- Couche 3
			i = i + 1
		end
	end
	
	-----------------------------------------------------------------------
	-- Fonction Oni_Giri		S'applique à :		ONI GIRI
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Zoro_Oni_Giri(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\pos(320,460)}Oni Giri
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro,,0000,0000,0000,,{\pos(320,460)}Oni Giri
		karaline.style = "Zoro 2"		
		karaline.text = "{\\pos(320,460)}" .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro"		
		karaline.text = "{\\pos(320,460)}" .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\r\pos(320,460)\3a&HFF&\clip(0,0,259,480)\t(0,110,\clip(0,0,289,480)}O{\alpha&HFF&}ni Giri
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\r\pos(320,460)\3a&HFF&\clip(0,0,259,480)\t(110,220,\clip(0,0,289,480)}O{\alpha&HFF&}ni Giri
		karaline.style = "Zoro 3"		
		karaline.text = "{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,259,480)\\t(0,110,\\clip(0,0,289,480)}O{\\alpha&HFF&}ni Giri"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,259,480)\\t(110,220,\\clip(0,0,289,480)}O{\\alpha&HFF&}ni Giri"
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\alpha&HFF&}O{\r\pos(320,460)\3a&HFF&\clip(0,0,280,480)\t(220,330,\clip(0,0,308,480)}n{\alpha&HFF&}i Giri
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\alpha&HFF&}O{\r\pos(320,460)\3a&HFF&\clip(0,0,280,480)\t(330,440,\clip(0,0,308,480)}n{\alpha&HFF&}i Giri
		karaline.style = "Zoro 3"		
		karaline.text = "{\\alpha&HFF&}O{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,280,480)\\t(220,330,\\clip(0,0,308,480)}n{\\alpha&HFF&}i Giri"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\alpha&HFF&}O{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,280,480)\\t(330,440,\\clip(0,0,308,480)}n{\\alpha&HFF&}i Giri"
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\alpha&HFF&}On{\r\pos(320,460)\3a&HFF&\clip(0,0,300,480)\t(440,550,\clip(0,0,316,480)}i {\alpha&HFF&}Giri
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\alpha&HFF&}On{\r\pos(320,460)\3a&HFF&\clip(0,0,300,480)\t(550,670,\clip(0,0,316,480)}i {\alpha&HFF&}Giri
		karaline.style = "Zoro 3"		
		karaline.text = "{\\alpha&HFF&}On{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,300,480)\\t(440,550,\\clip(0,0,316,480)}i {\\alpha&HFF&}Giri"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\alpha&HFF&}On{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,300,480)\\t(550,670,\\clip(0,0,316,480)}i {\\alpha&HFF&}Giri"
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\alpha&HFF&}Oni {\r\pos(320,460)\3a&HFF&\clip(0,0,317,480)\t(670,820,\clip(0,0,344,480)}G{\alpha&HFF&}iri
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\alpha&HFF&}Oni {\r\pos(320,460)\3a&HFF&\clip(0,0,317,480)\t(820,970,\clip(0,0,344,480)}G{\alpha&HFF&}iri
		karaline.style = "Zoro 3"		
		karaline.text = "{\\alpha&HFF&}Oni {\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,317,480)\\t(670,820,\\clip(0,0,344,480)}G{\\alpha&HFF&}iri"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\alpha&HFF&}Oni {\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,317,480)\\t(820,970,\\clip(0,0,344,480)}G{\\alpha&HFF&}iri"
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\alpha&HFF&}Oni G{\r\pos(320,460)\3a&HFF&\clip(0,0,338,480)\t(970,1120,\clip(0,0,354,480)}i{\alpha&HFF&}ri
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\alpha&HFF&}Oni G{\r\pos(320,460)\3a&HFF&\clip(0,0,338,480)\t(1120,1270,\clip(0,0,354,480)}i{\alpha&HFF&}ri
		karaline.style = "Zoro 3"		
		karaline.text = "{\\alpha&HFF&}Oni G{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,338,480)\\t(970,1120,\\clip(0,0,354,480)}i{\\alpha&HFF&}ri"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\alpha&HFF&}Oni G{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,338,480)\\t(1120,1270,\\clip(0,0,354,480)}i{\\alpha&HFF&}ri"
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\alpha&HFF&}Oni Gi{\r\pos(320,460)\3a&HFF&\clip(0,0,346,480)\t(1270,1420,\clip(0,0,371,480)}r{\alpha&HFF&}i
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\alpha&HFF&}Oni Gi{\r\pos(320,460)\3a&HFF&\clip(0,0,346,480)\t(1420,1570,\clip(0,0,371,480)}r{\alpha&HFF&}i
		karaline.style = "Zoro 3"		
		karaline.text = "{\\alpha&HFF&}Oni Gi{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,346,480)\\t(1270,1420,\\clip(0,0,371,480)}r{\\alpha&HFF&}i"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\alpha&HFF&}Oni Gi{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,346,480)\\t(1420,1570,\\clip(0,0,371,480)}r{\\alpha&HFF&}i"
		subtitles.append(karaline) -- Couche 1
		
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 3,,0000,0000,0000,,{\alpha&HFF&}Oni Gir{\r\pos(320,460)\3a&HFF&\clip(0,0,364,480)\t(1570,1720,\clip(0,0,379,480)}i
		-- Dialogue: 0,0:10:48.20,0:10:49.83,Zoro 2,,0000,0000,0000,,{\alpha&HFF&}Oni Gir{\r\pos(320,460)\3a&HFF&\clip(0,0,364,480)\t(1720,1870,\clip(0,0,379,480)}i
		karaline.style = "Zoro 3"		
		karaline.text = "{\\alpha&HFF&}Oni Gir{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,364,480)\\t(1570,1720,\\clip(0,0,379,480)}i"
		subtitles.append(karaline) -- Couche 1
		karaline.style = "Zoro 2"		
		karaline.text = "{\\alpha&HFF&}Oni Gir{\\r\\pos(320,460)\\3a&HFF&\\clip(0,0,364,480)\\t(1720,1870,\\clip(0,0,379,480)}i"
		subtitles.append(karaline) -- Couche 1
		
	end
	
	-----------------------------------------------------------------------
	-- Fonction Ittouryuu		S'applique à :		ITTOURYUU, Hirameki
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Zoro_Ittouryuu(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1		
		karaline.style = "Zoro"
		
		-- Dialogue: 0,0:04:04.04,0:04:05.63,Zoro,Zoro,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,0,640,444)\t(0,250,\frz2)\t(250,500,\frz0)}Ittouryuu
		-- Dialogue: 0,0:04:04.04,0:04:05.63,Zoro,Zoro,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,444,640,480)\t(0,250,\frz-2)\t(250,500,\frz0)}Ittouryuu
		karaline.text = "{\\org(320,10000)\\pos(320,460)\\clip(0,0,640,444)\\t(0,250,\\frz2)\\t(250,500,\\frz0)}" .. karaline.text_stripped
		subtitles.append(karaline)
		karaline.text = "{\\org(320,10000)\\pos(320,460)\\clip(0,444,640,480)\\t(0,250,\\frz-2)\\t(250,500,\\frz0)}" .. karaline.text_stripped
		subtitles.append(karaline)
	end

	-----------------------------------------------------------------------
	-- Fonction Santouryuu			S'applique à :		---
	-----------------------------------------------------------------------
	-- Surcharge : <rien>
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Zoro_Santouryuu(karaline, subtitles)
		-- Couleur du style &H80C351&
		local newline = "{\\pos(320,460)\\t(0,100,\\3c" .. invertcolor("&H80C351&") .. ")\\t(100,200,\\3c&H80C351&)\\t(200,300,\\3c" .. invertcolor("&H80C351&") .. ")\\t(300,400,\\3c&H80C351&)\\t(400,500,\\3c" .. invertcolor("&H80C351&") .. ")\\t(500,600,\\3c&H80C351&)}" .. karaline.text_stripped
		subtitles.append(formatline(karaline, newline, "Zoro"))
		
		karaline.style = "Zoro 3"
		karaline.layer = 2
		karaline.text = "{\\pos(320,460)\\3c&HFFFFCC&\\blur10\\be1\\clip(150,0,160,480)\\t(\\clip(490,0,500,480))}" .. karaline.text_stripped
		subtitles.append(karaline) -- Couche 2		
	end
	



-- #########################################################################################
-- ### Attaques de Nami
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction Thunderbolt			S'applique à :		THUNDERBOLT TEMPO,  Thunder |Charge,
	-----------------------------------------------------------------------
	-- Surcharge : \org(2090,60000)\i1\frz0\fscy100\bord1\t(0,210,\frz0.03\bord4)\t(0,105,\fscy80)\t(105,210,\fscy100)\t(210,420,\bord1)\k2\alpha&h00&\t(2090,6300,\alpha&ff&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Nami_Thunderbolt(karaline)
		local newline = "{\\org(2090,60000)\\i1\\frz0\\fscy100\\bord1\\t(0,210,\\frz0.03\\bord4)\\t(0,105,\\fscy80)\\t(105,210,\\fscy100)"
		.. "\\t(210,420,\\bord1)\\k2\\alpha&h00&\\t(2090,6300,\\alpha&ff&)}" .. karaline.text_stripped
		return formatline(karaline, newline, "Nami")
	end
	
	-----------------------------------------------------------------------
	-- Fonction Bam_Bam_Tornado			S'applique à :		His|sa|tsu, Bam |Bam | Tor|na|do, Thunder |Ball, 
	-----------------------------------------------------------------------
	-- Surcharge : <rien>
	-- Sur chaque syllabe : \r\t(0,390,\fscy50\fscy100\bord5\bord2\1c&HFFFFFF&\be1)
	-----------------------------------------------------------------------
	function Nami_Bam_Bam_Tornado(karaline)
		local temp = ""
		local newline = ""
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscy50\\fscy100\\bord5\\bord2\\1c&HFFFFFF&\\be1)}%s", syl.start_time, syl.end_time, syl.text_stripped)
			newline = newline .. temp
		end
		return formatline(karaline, newline, "Nami")
	end
	
	-- TODO Hissatsu ? + Bam Tornado
	-- Dialogue: 0,0:08:47.03,0:08:48.18,Nami,,0000,0000,0000,,{\r}{\t(0,390,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)}His{\r}{\t(390,640,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)}sat{\r}{\t(640,840,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)}tsu{\r}{\t(840,980,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)}!
	-- Dialogue: 0,0:08:48.18,0:08:50.88,Nami,,0000,0000,0000,,{\r}{\t(0,390,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)}Bam{\r}{\t(390,640,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)} Bam{\r}{\t(640,840,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)} Torn{\r}{\t(840,980,\fscy50,\fscy100,\bord5,\bord2,\1c&HFFFFFF&\be1)}ado !

-- Dialogue: 0,0:13:07.47,0:13:09.24,Nami,ATTAQUES,0000,0000,0000,,{\t(0,1500,\fs50)}ColA Engine 
-- Dialogue: 0,0:13:09.30,0:13:12.22,Nami,,0000,0000,0000,,{\t(0,1500,\fs50)}PAddle Ship Sunny Go !


-- #########################################################################################
-- ### Attaques de Captain Usopp
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction Boshi				S'applique à :		BO|SHI, KE|MU|RI, HIS|SA|TSU, KAEN |BOSHI, FIRE |BIRD |STAR, His|sa|tsu |Chou |Ke|mu|ri |Bo|shi, Ta|ba|sco, Sange|kuri ; 
	-----------------------------------------------------------------------
	-- Surcharge : \org(1000,1000)
	-- Sur chaque syllabe : \r\t(sylStart,sylEnd,\frz3,\frz0,\alpha&H80&)
	-----------------------------------------------------------------------
	function Usopp_Boshi(karaline)
		local temp = ""
		local newline = "{\\org(1000,1000)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\frz3\\frz0\\alpha&H80&)}%s", syl.start_time, syl.end_time, syl.text_stripped)
			newline = newline .. temp
			-- temp = string.format("{\\r\\t(%d,%d,\\frz0\\alpha&H80&)}%s", syl.start_time, syl.end_time, syl.text_stripped)
			-- newline = newline .. temp
		end
		karaline.comment = false
		karaline.style = "Usopp"
		karaline.actor = ""
		karaline.text = newline
		return karaline
	end
	
	-- TODO 
	-- Dialogue: 0,0:12:54.81,0:12:55.73,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,460,\frz3,\frz0,\alpha&H80)}Sange{\r}{\t(460,920,\frz3,\frz0,\alpha&H80)}kuri
	-- Dialogue: 0,0:12:56.52,0:12:57.05,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(4,201,\frz3,\frz0,\alpha&H80)}Ka{\r}{\t(202,350,\frz3,\frz0,\alpha&H80)}e {\r}{\t(350,530,\frz3,\frz0,\alpha&H80)}ni
	-- Dialogue: 0,0:12:57.73,0:12:58.18,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,107,\frz3,\frz0,\alpha&H80)}Bo{\r}{\t(107,450,\frz3,\frz0,\alpha&H80)}shi
	



-- #########################################################################################
-- ### Attaques de Sanji
-- #########################################################################################

	-----------------------------------------------------------------------
	-- Fonction Collier_Shoot		S'applique à :		COLLIER SHOOT CONCASSE
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Sanji_Collier_Shoot(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1		
		karaline.style = "sanji diable 2"
		
		-- Dialogue: 0,0:12:37.46,0:12:39.12,sanji diable 2,,0000,0000,0000,,{\pos(320,460)\1a&HFF&\3a&HFF&\bord0\4c&HCDF7FE&\t(160,161,\bord10)\t(160,1660,\4c&H082F93&)\t(160,260,\shad20)\t(260,360,\shad5)\t(360,460,\shad20)\t(360,460,\shad5)\t(460,560,\shad20)\t(560,660,\shad20)\t(660,760,\shad5)\t(760,860,\shad20)\t(860,960,\shad5)\t(960,1060,\shad20)\t(1060,1160,\shad5)\t(1160,1260,\shad20)\t(1260,1360,\shad5)\t(1360,1460,\shad20)\t(1360,1460,\shad5)\t(1460,1560,\shad20)\t(1560,1660,\shad0\bord0)}Collier Shoot
		-- Dialogue: 0,0:12:37.46,0:12:39.12,sanji diable 2,,0000,0000,0000,,{\pos(320,460)\1a&HFF&\clip(0,0,640,480)}Collier Shoot
		karaline.text = "{\\pos(320,460)\\1a&HFF&\\3a&HFF&\\bord0\\4c&HCDF7FE&\\t(160,161,\\bord10)\\t(160,1660,\\4c&H082F93&)\\t(160,260,\\shad20)" 
		.. "\\t(260,360,\\shad5)\\t(360,460,\\shad20)\\t(360,460,\\shad5)\\t(460,560,\\shad20)\\t(560,660,\\shad20)\\t(660,760,\\shad5)" 
		.. "\\t(760,860,\\shad20)\\t(860,960,\\shad5)\\t(960,1060,\\shad20)\\t(1060,1160,\\shad5)\\t(1160,1260,\\shad20)\\t(1260,1360,\\shad5)" 
		.. "\\t(1360,1460,\\shad20)\\t(1360,1460,\\shad5)\\t(1460,1560,\\shad20)\\t(1560,1660,\\shad0\\bord0)}" .. karaline.text_stripped
		subtitles.append(karaline)
		karaline.text = "{\\pos(320,460)\\1a&HFF&\\clip(0,0,640,480)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.style = "sanji diable"
		degrade = layercolor("&H082F93&", "&HCDF7FE&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)\\3a&HFF&\\4a&HFF&}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end
	
	-----------------------------------------------------------------------
	-- Fonction Collier_Shoot		S'applique à :		CHASSE BASSES COTES
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Sanji_Chasse(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "sanji diable 2"
		
		i = 0
		while i <= 8 do
			karaline.text = "{\\alpha&HFF&\\t(" .. 200*i .. "," .. (200*i)+1 .. ",\\alpha&H00&)\\t(" .. 100+(200*i) .. "," .. 101+(200*i)
			.. ",\\alpha&HFF&)\\move(310,460,330,460," .. 200*i .. "," .. 100+(200*i) .. ")\\1a&HFF&\\3c&HCDF7FE&\\4c&HCDF7FE&\\bord7" 
			.. "\\t(0,1600,\\3c&H082F93&\\4c&H082F93&)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
		
		karaline.layer = 2
		i = 0
		while i <= 7 do
			karaline.text = "{\\alpha&HFF&\\t(" .. (200*i)+100 .. "," .. (200*i)+101 .. ",\\alpha&H00&)\\t(" .. 200+(200*i) .. "," .. 201+(200*i)
			.. ",\\alpha&HFF&)\\move(330,460,310,460," .. 100+(200*i) .. "," .. 200+(200*i) .. ")\\1a&HFF&\\3c&HCDF7FE&\\4c&HCDF7FE&\\bord7" 
			.. "\\t(0,1600,\\3c&H082F93&\\4c&H082F93&)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
		
		karaline.layer = 3
		karaline.style = "sanji diable"
		degrade = layercolor("&H082F93&", "&HCDF7FE&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)\\3a&HFF&\\4a&HFF&}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end
	
	-----------------------------------------------------------------------
	-- Fonction Collier_Frit		S'applique à :		COLLIER FRIT, TROISIEME HACHE, TENDRON
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)}{\t(1200,1410,\fry1440,\alpha&HFF&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Sanji_Collier_Frit(karaline)
		local newline = "{\\pos(320,460)\\1a&HFF&\\3a&HFF&\\bord0\\4c&HCDF7FE&\\t(160,161,\\bord10)\\t(160,1660,\\4c&H082F93&)\\t(160,260,\\shad20)" 
		.. "\\t(260,360,\\shad5)\\t(360,460,\\shad20)\\t(360,460,\\shad5)\\t(460,560,\\shad20)\\t(560,660,\\shad20)\\t(660,760,\\shad5)\\t(760,860,\\shad20)" 
		.. "\\t(860,960,\\shad5)\\t(960,1060,\\shad20)\\t(1060,1160,\\shad5)\\t(1160,1260,\\shad20)\\t(1260,1360,\\shad5)\\t(1360,1460,\\shad20)" 
		.. "\\t(1360,1460,\\shad5)\\t(1460,1560,\\shad20)\\t(1560,1660,\\shad0\\bord0)}" .. karaline.text_stripped
		return formatline(karaline, newline, "sanji diable 2")
	end
	
	-----------------------------------------------------------------------
	-- Fonction Flanchet		S'applique à :		LONGE, FLANCHET, QUASI, JARRET
	-----------------------------------------------------------------------
	-- Surcharge : \pos(320,460)}{\t(1200,1410,\fry1440,\alpha&HFF&)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Sanji_Flanchet(karaline)
		local newline = "{\\alpha&HFF&\\t(0,1,\\alpha&H00&)\\t(100,101,\\alpha&HFF&)\\move(310,460,330,460,0,100)\\1a&HFF&\\3c&HCDF7FE&\\4c&HCDF7FE&\\bord7" 
		.. "\\t(0,1600,\\3c&H082F93&\\4c&H082F93&)}" .. karaline.text_stripped
		return formatline(karaline, newline, "sanji diable 2")
	end
	
	function Sanji_Menton(karaline)
		local newline = "{\\move(310,460,330,460,0,100)\\1a&H7F&\be1\\blur10\\3c&HCDF7FE&\\4c&HCDF7FE&\\bord7\\t(0,1600,\\3c&H082F93&\\4c&H082F93&)}" 
		.. karaline.text_stripped
		return formatline(karaline, newline, "sanji diable 2")
	end
	-- Dialogue: 0,0:12:43.31,0:12:45.45,sanji diable 2,Sanji,0000,0000,0000,,{\pos(320,460)\1a&HFF&\3a&HFF&\bord0\4c&HCDF7FE&\t(160,161,\bord10)\t(160,1660,\4c&H082F93&)\t(160,260,\shad20)\t(260,360,\shad5)\t(360,460,\shad20)\t(360,460,\shad5)\t(460,560,\shad20)\t(560,660,\shad20)\t(660,760,\shad5)\t(760,860,\shad20)\t(860,960,\shad5)\t(960,1060,\shad20)\t(1060,1160,\shad5)\t(1160,1260,\shad20)\t(1260,1360,\shad5)\t(1360,1460,\shad20)\t(1360,1460,\shad5)\t(1460,1560,\shad20)\t(1560,1660,\shad0\bord0)}Collier Frit



-- #########################################################################################
-- ### Attaques de Nico Robin
-- #########################################################################################

	-----------------------------------------------------------------------
	-- Fonction X_Fleur		S'applique à :		
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Robin_X_Fleur(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Robin 3"
		
		t = split(karaline.text_stripped,'[ ]+')
		
		karaline.text = "{\\alpha&HFF&}" .. t[1] .. " {\\r\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(600,1480,\\bord30\\alpha&HFF&)}" .. t[2]
		subtitles.append(karaline)
		
		karaline.text = "{\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(0,600,\\bord30\\alpha&HFF&)}" .. t[1] .. " {\\alpha&HFF&}" .. t[2]
		subtitles.append(karaline)
		
		karaline.style = "Robin 2"
		karaline.text = "{\\pos(320,460)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.style = "Robin"
		degrade = layercolor("&H9D5BB3&", "&HFFFFFF&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end
	
	-----------------------------------------------------------------------
	-- Fonction Delphinium		S'applique à :		
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Robin_Delphinium(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Robin 3"
		
		karaline.text = "{\\fad(0,1000)\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(600,1480,\\bord30\\alpha&HFF&)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.text = "{\\fad(0,1000)\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(0,600,\\bord30\\alpha&HFF&)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.style = "Robin 2"
		karaline.text = "{\\pos(320,460)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.style = "Robin"
		degrade = layercolor("&H9D5BB3&", "&HFFFFFF&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end
	
	-----------------------------------------------------------------------
	-- Fonction Slap		S'applique à :		
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Robin_Slap(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Robin 3"
		
		karaline.text = "{\\fad(0,1000)\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(600,1480,\\bord30\\alpha&HFF&)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.text = "{\\fad(0,1000)\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(0,600,\\bord30\\alpha&HFF&)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.style = "Robin 2"
		karaline.text = "{\\pos(320,460)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.style = "Robin"
		degrade = layercolor("&H9D5BB3&", "&HFFFFFF&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end


-- #########################################################################################
-- ### Attaques de Tony Tony Chopper
-- #########################################################################################

	-----------------------------------------------------------------------
	-- Fonction Rumble		S'applique à :	Rumble, Kokute Roseo
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Chopper_Rumble(karaline)
		local newline = "{\\t(200,800,\\3c&H2BDADD&)\\t(1500,1501,\\3c&H000000&)\\t(1000,1200,\\fscy150\\fscx50)\\t(1200,1400,\\fscy100\\fscx100)}" .. karaline.text_stripped
		return formatline(karaline, newline, "Chopper")
	end
	
	-----------------------------------------------------------------------
	-- Fonction Guard_Point		S'applique à :	Guard Point	
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : ---
	-----------------------------------------------------------------------
	function Chopper_Guard_Point(karaline)
		local newline = "{\\pos(320,460)\\t(0,180,\\fs80)\\t(180,480,\\fs45)}" .. karaline.text_stripped
		return formatline(karaline, newline, "Chopper")
	end


-- #########################################################################################
-- ### Attaques de Francky
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction Coup_De			S'applique à :			COUP DE, BURST,  Boo, Vent, Heavy Nunchaku, Strong Hammer, 
	-----------------------------------------------------------------------
	-- Surcharge : \t(1000,1500,\3c&H2BDADD&)\t(1500,1501,\3c&H000000&)\t(1000,1200,\fscy150\fscx50)\t(1200,1400,\fscy100\fscx100)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Francky_Coup_De(karaline)
		local newline = "{\\t(1000,1500,\\3c&H2BDADD&)\\t(1500,1501,\\3c&H000000&)\\t(1000,1200,\\fscy150\\fscx50)"
		.. "\\t(1200,1400,\\fscy100\\fscx100)}" .. karaline.text_stripped
		return formatline(karaline, newline, "Francky")
	end
	
	-----------------------------------------------------------------------
	-- Fonction Weapons_Left			S'applique à :		Weapons Left, Weapon Left, Fresh Fire, Strong Right
	-----------------------------------------------------------------------
	-- Surcharge : \t(1000,1500,\3c&H2BDADD&)\t(1500,1501,\3c&H000000&)\t(1000,1200,\fscy150\fscx50)\t(1200,1400,\fscy100\fscx100)
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Francky_Weapons_Left(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Francky 2"
		
		karaline.text = "{\\org(320,10000)\\clip(0,0,280,600)\\t(1000,2000,\\frz3)\\p1+} m 0 0 s 25 0 25 40 0 40 c {\\p0}"
		subtitles.append(karaline)
		
		karaline.text = "{\\org(320,10000)\\clip(350,0,640,600)\\t(1000,2000,\\frz-3)\\p1+} m 0 0 s 25 0 25 40 0 40 c {\\p0}"
		subtitles.append(karaline)
		
		karaline.style = "Francky"
		karaline.text = "{\\t(1000,1500,\\3c&H2BDADD&)\\t(1500,1501,\\3c&H000000&)\\t(1000,1200,\\fscy150\\fscx50)" 
		.. "\\t(1200,1400,\\fscy100\\fscx100)}" .. karaline.text_stripped
		subtitles.append(karaline)
	end


-- #########################################################################################
-- ### Attaques de Brook
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction Yahazu_Giri			S'applique à :		Hanauta Sanchou, Yahazu Giri,
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Brook_Yahazu_Giri(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Brook"
		
		karaline.text = "{\\org(320,10000)\\pos(320,460)\\clip(0,0,640,444)\\t(0,250,\\frz2)\\t(250,500,\\frz0)}" .. karaline.text_stripped
		subtitles.append(karaline)
		
		karaline.text = "{\\org(320,10000)\\pos(320,460)\\clip(0,444,640,480)\\t(0,250,\\frz-2)\\t(250,500,\\frz0)}" .. karaline.text_stripped
		subtitles.append(karaline)
	end
	

-- #########################################################################################
-- ### ARC THRILLER BARK --- Attaques de Perona
-- #########################################################################################
	-----------------------------------------------------------------------
	-- Fonction Thriller_Bark_Perona_Negative_Hollow			S'applique à :		negative hollow
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Thriller_Bark_Perona_Negative_Hollow(karaline, subtitles)
		newline = "{\\an5\\pos(320,445)\\t(0,300,\\alpha&HFF&)\\t(300,600,\\alpha&H00&)\\t(600,900,\\alpha&HFF&)\\t(900,1200,\\alpha&H00&)" 
		.. "\\t(1200,1500,\\alpha&HFF&)\\t(1500,1800,\\alpha&H00&)\\t(1800,2100,\\alpha&HFF&)\\t(2100,2400,\\alpha&H00&)}" .. karaline.text_stripped
		subtitles.append(formatline(karaline, newline, "Perona"))
		
		newline = "{\\an3\\pos(320,450)\\t(0,2000,\\frz720)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\pos(320,450)\\frz120\\t(0,2000,\\frz840)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\pos(320,450)\\frz240\\t(0,2000,\\frz960)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
	end
	
	-----------------------------------------------------------------------
	-- Fonction Thriller_Bark_Perona_Negative_Hollows			S'applique à :		negative hollows
	-----------------------------------------------------------------------
	-- Surcharge : ---
	-- Sur chaque syllabe : <rien>
	-----------------------------------------------------------------------
	function Thriller_Bark_Perona_Negative_Hollows(karaline, subtitles)
		newline = "{\\an5\\pos(320,445)\\t(0,300,\\alpha&HFF&)\\t(300,600,\\alpha&H00&)\\t(600,900,\\alpha&HFF&)\\t(900,1200,\\alpha&H00&)" 
		.. "\\t(1200,1500,\\alpha&HFF&)\\t(1500,1800,\\alpha&H00&)\\t(1800,2100,\\alpha&HFF&)\\t(2100,2400,\\alpha&H00&)}" .. karaline.text_stripped
		subtitles.append(formatline(karaline, newline, "Perona"))
		
		newline = "{\\an3\\move(320,450,220,450,0,2000)\\t(0,2000,\\frz720\\alpha&HFF&)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\move(320,450,220,450,0,2000)\\frz120\\t(0,2000,\\frz840\\alpha&HFF&)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\move(320,450,220,450,0,2000)\\frz240\\t(0,2000,\\frz960\\alpha&HFF&)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		
		newline = "{\\an3\\move(320,450,420,450,0,2000)\\t(0,2000,\\frz720\\alpha&HFF&)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\move(320,450,420,450,0,2000)\\frz120\\t(0,2000,\\frz840\\alpha&HFF&)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\move(320,450,420,450,0,2000)\\frz240\\t(0,2000,\\frz960\\alpha&HFF&)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		
		newline = "{\\an3\\pos(320,450)\\t(0,2000,\\frz720)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\pos(320,450)\\frz120\\t(0,2000,\\frz840)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
		newline = "{\\an3\\pos(320,450)\\frz240\\t(0,2000,\\frz960)\\p1+}m -10 -5 l 10 -5 b 13 -5 15 -3 15 0 c b 15 3 13 5 10 5 c l -10 5 b -13 5 -15 3 -15 0 c b -15 -3 -13 -5 -10 -5 c{\\p0}"
		subtitles.append(formatline(karaline, newline, "Perona"))
	end
	
-- #########################################################################################
-- ### ARC ARLONG PARK --- Attaques de Hachi
-- #########################################################################################
	
	function Arlong_Park_Hachi_Tako_Hachi(karaline, subtitles)
		local temp = ""
		local newline = "{\\pos(320,460)\\org(-10000,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx170\\fscy200\\1c&HFFFFFF&)\\t(%d,%d,\\fscx100\\fscy100\\1c&HFF0000&\\alpha&HFF&\\frz-0.5)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Hachi"))
	end
	
	function Arlong_Park_Hachi_Rokutouryu(karaline, subtitles)
		local temp = ""
		local newline = "{\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx30\\fscy200\\1c&HFFFFFF&)\\t(%d,%d,\\fscx100\\fscy100\\1c&HFF0000&\\alpha&HFF&)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Hachi"))
	end

--- ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ - Shichibukai
--- ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
	
-- #########################################################################################
-- ### Shichibukai - Bartholomew Kuma
-- #########################################################################################
	
	function Kuma_Ursus(karaline, subtitles)
		local middle = karaline.duration/2
		local newline = "{\\an5\\pos(640,665)\\org(640,10000)\\frz0\\t(0,500,\\frz0.02)\\t(500,1000,\\frz-0.02)" 
		.. "\\t(1000,1500,\\frz0.02)\\t(1500,2000,\\frz0.02)\\t(2000,2250,\\frz0)"
		.. "\\t(0," .. middle ..",\\3c&HBABAC0&\\1c&H19171C&)\\t(" .. middle .."," .. karaline.duration ..",\\3c&H19171C&\\1c&HBABAC0&)}"
		.. karaline.text_stripped
		subtitles.append(formatline(karaline, newline, "Kuma"))
	end
	
-- #########################################################################################
-- ### Shichibukai - Gecko Moria
-- #########################################################################################
	
	function Moria_Doppelman(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(640,665)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx170\\fscy170)\\t(%d,%d,\\fscx100\\fscy100)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp
		end
		subtitles.append(formatline(karaline, newline, "Moria"))
	end
	
	function Moria_TsunoTokage(karaline, subtitles)
		local middle = karaline.duration/2
		local newline = "{\\an5\\move(640,665,600,665)\\alpha&HFF&\\3a&H00&\\t(\\3a&HFF&)}" .. karaline.text_stripped		
		subtitles.append(formatline(karaline, newline, "Moria"))
		local newline = "{\\an5\\move(640,665,680,665)\\alpha&HFF&\\3a&H00&\\t(\\3a&HFF&)}" .. karaline.text_stripped		
		subtitles.append(formatline(karaline, newline, "Moria"))
		local newline = "{\\an5\\pos(640,665)\\t(\\alpha&HFF&)\\t(0," .. middle .. ",\\fscy150)"
		.. "\\t(" .. middle .. "," .. karaline.duration .. ",\\fscy100)}" .. karaline.text_stripped		
		subtitles.append(formatline(karaline, newline, "Moria"))
	end
	
-- #########################################################################################
-- ### Shichibukai - Boa Hancock --- à partir de ARC SABOADY / AMAZON LILY / INPEL DAWN
-- #########################################################################################	

	function Amazon_Lily_Hancok_Mero_Mero(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(640,665)}"
		local fxcoeur = "{\\an7\\fad(100,100)\\move(376,660,904,660)\\fscx180\\fscy180\\t(\\fry720)\\bord5\\be1\\blur5\\alpha&HFF&\\3a&H7F&\\3c&H9900FF&\\p1}m 0 15 l -17 -10 b -24 -21 0 -31 0 -11 b 0 -31 24 -21 17 -10 {\\p0}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx150\\fscy150\\1c&H9900FF&)\\t(%d,%d,\\fscx100\\fscy100\\1c&HFAF1FB&)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Hebihime"))
		subtitles.append(formatline(karaline, fxcoeur, "Hebihime"))
	end
	
-- #########################################################################################
-- ### ARC SABOADY / AMAZON LILY / INPEL DAWN --- Attaques de Sonia
-- #########################################################################################	

	function Amazon_Lily_Sonia_Hebi_Slam(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Sonia"
		
		t = split(karaline.text_stripped,'[ ]+')
		
		karaline.text = "{\\alpha&HFF&}" .. t[1] .. " {\\r\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(600,1480,\\bord30\\alpha&HFF&)}" .. t[2]
		subtitles.append(karaline)
		
		karaline.text = "{\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(0,600,\\bord30\\alpha&HFF&)}" .. t[1] .. " {\\alpha&HFF&}" .. t[2]
		subtitles.append(karaline)
		
		karaline.style = "Sonia"
		degrade = layercolor("&H32EAB0&", "&H1A926C&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end
	
	function Amazon_Lily_Sonia_Hebigami_Tsuki(karaline, subtitles)
		local newline = ""
		degrade = layercolor("&H32EAB0&", "&H1A926C&", 456-418)
		i = 419
		while i <= 456 do
			newline = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(formatline(karaline, newline, "Sonia"))
			i = i + 1
		end
		
		newline = "{\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\alpha&HFF&\\t(%d,%d,\\fscx150\\fscy150\\1c&H32EAB0&\\alpha&H00&)\\t(%d,%d,\\fscx100\\fscy100\\1c&H1A926C&\\alpha&HFF&)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Sonia"))
	end

-- #########################################################################################
-- ### ARC SABOADY / AMAZON LILY / INPEL DAWN --- Attaques de Marie
-- #########################################################################################	

	function Amazon_Lily_Marie_Hebi_Stick(karaline, subtitles)
		karaline.comment = false
		karaline.actor = ""
		karaline.layer = 1
		karaline.style = "Marie"
		
		t = split(karaline.text_stripped,'[ ]+')
		
		karaline.text = "{\\alpha&HFF&}" .. t[1] .. " {\\r\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(600,1480,\\bord30\\alpha&HFF&)}" .. t[2]
		subtitles.append(karaline)
		
		karaline.text = "{\\1a&HFF&\\4a&HFF&\\pos(320,460)\\t(0,600,\\bord30\\alpha&HFF&)}" .. t[1] .. " {\\alpha&HFF&}" .. t[2]
		subtitles.append(karaline)
		
		karaline.style = "Marie"
		degrade = layercolor("&H37EBEE&", "&H37B8EE&", 456-418)
		i = 419
		while i <= 456 do
			karaline.text = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(karaline)
			i = i + 1
		end
	end
	
	function Amazon_Lily_Marie_Hebigami_Tsuki(karaline, subtitles)
		local newline = ""
		degrade = layercolor("&H37EBEE&", "&H37B8EE&", 456-418)
		i = 419
		while i <= 456 do
			newline = "{\\1c" .. degrade[i-418] .. "\\clip(0," .. i .. ",2000," .. i+1 .. ")\\pos(320,460)}" .. karaline.text_stripped
			subtitles.append(formatline(karaline, newline, "Marie"))
			i = i + 1
		end
		
		newline = "{\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\alpha&HFF&\\t(%d,%d,\\fscx150\\fscy150\\1c&H37EBEE&\\alpha&H00&)\\t(%d,%d,\\fscx100\\fscy100\\1c&H37B8EE&\\alpha&HFF&)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Marie"))
	end

-- #########################################################################################
-- ### ARC SABOADY --- Attaques du gros tas dont il faut trouver le nom
-- #########################################################################################	
	
	function Saboady_GrosTas_Ashigara(karaline, subtitles)
		local temp = ""
		local newline = "{\\pos(320,460)}"
		local fx = "{\\pos(320,460)\\alpha&HFF&\\bord10\\fscx200\\fscy200\\t(0,500,\\fscx100\\fscy100\\3a&H00&)\\t(500,500,\\3a&HFF&)}" .. karaline.text_stripped
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx150\\fscy150\\1c&HFFFFFF&)\\t(%d,%d,\\fscx100\\fscy100\\1c&H2D1BA9&)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, fx, "grostassansnom"))
		subtitles.append(formatline(karaline, newline, "grostassansnom"))
	end
	
-- #########################################################################################
-- ### ARC BUGGY --- Attaques de Buggy
-- #########################################################################################	
	
	function Buggy_Bara_Bara_Kinkyuu_Dasshutsu(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(320,438)\\org(-10000,438)\\clip(0,400,640,438)}"		
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			
			if i==1 then
				temp = "{\\t(0," .. middle .. ",\\frz0.06\\clip(0,400,640,428))"
			.. "\\t(" .. middle .. "," .. syl.end_time .. ",\\frz0\\clip(0,400,640,438))"
			.. "\\t(" .. syl.end_time .. "," .. syl.end_time .. ",\\alpha&HFF)}" .. syl.text_stripped
			else
				temp = "{\\r\\alpha&HFF\\t(" .. syl.start_time .. "," .. syl.start_time .. ",\\alpha&H00)"
			.. "\\t(0," .. middle .. ",\\frz0.06\\clip(0,400,640,428))"
			.. "\\t(" .. middle .. "," .. syl.end_time .. ",\\frz0\\clip(0,400,640,438))"
			.. "\\t(" .. syl.end_time .. "," .. syl.end_time .. ",\\alpha&HFF)}" .. syl.text_stripped
			end
			
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Buggy"))
		
		temp = ""
		newline = "{\\an5\\pos(320,438)\\org(-10000,438)\\clip(0,438,640,480)}"		
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			
			if i==1 then
				temp = "{\\t(0," .. middle .. ",\\frz-0.06\clip(0,447,640,480))"
			.. "\\t(" .. middle .. "," .. syl.end_time .. ",\\frz0\\clip(0,438,640,480))"
			.. "\\t(" .. syl.end_time .. "," .. syl.end_time .. ",\\alpha&HFF)}" .. syl.text_stripped
			else
				temp = "{\\r\\alpha&HFF\\t(" .. syl.start_time .. "," .. syl.start_time .. ",\\alpha&H00)"
			.. "\\t(0," .. middle .. ",\\frz-0.06\clip(0,447,640,480))"
			.. "\\t(" .. middle .. "," .. syl.end_time .. ",\\frz0\\clip(0,438,640,480))"
			.. "\\t(" .. syl.end_time .. "," .. syl.end_time .. ",\\alpha&HFF)}" .. syl.text_stripped
			end
			
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Buggy"))
		
		temp = ""
		newline = "{\\an5\\pos(320,438)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			
			if i==1 then
				temp = "{\\alpha&HFF\\t(" .. syl.end_time .. "," .. syl.end_time .. ",\\alpha&H00)}" .. syl.text_stripped
			else
				temp = "{\\r\\t(" .. syl.start_time .. "," .. syl.start_time .. ",\\alpha&HFF)\\t(" .. syl.end_time .. "," .. syl.end_time .. ",\\alpha&H00)}" .. syl.text_stripped
			end
			
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Buggy"))
	end
	
	function Buggy_Senbei(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(320,438)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = "{\\r\\t(0," .. line.duration .. ",\\3c&H0033FF&\\3a&HFF&\\bord20)\\k" .. syl.kdur .. "}" .. syl.text_stripped
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Buggy"))
	end
	
	function Buggy_Kuuchuu_Kirimomi_Dai_Circus(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(320,438)\\org(-10000,438)\\fad(0," .. karaline.duration .. ")}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = "{\\r\\t(0," .. middle .. ",\\frz-0.06)\\t(" .. middle .. "," .. syl.end_time .. ",\\frz0)"
			.. "\\t(0," .. karaline.duration .. ",\\3c&H0033FF&\\bord20)\\k" .. syl.kdur .. "}" .. syl.text_stripped
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Buggy"))
	end

-- #########################################################################################
-- ### ARC BAROQUE WORKS --- Attaques de Mr. 3
-- #########################################################################################	
	
	--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	--@ Fonction="Mr3_Candle" - Personnage="Mr. 3" - Karaoke="par syllabe"
	--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	function Mr3_Candle(karaline, subtitles)
		local temp = ""
		local newline = "{\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fs80)\\t(%d,%d,\\fs45)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Mr.3"))
	end
	
-- #########################################################################################
-- ### ARC BAROQUE WORKS --- Attaques de Mr. 2 - Bon Clay
-- #########################################################################################	
	
	--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	--@ Fonction="Mr2_Hakuchou" - Personnage="Mr. 2" - Karaoke="par syllabe"
	--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	function Mr2_Hakuchou(karaline, subtitles)
		local temp = ""
		local newline = "{\\pos(320,460)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fs80)\\t(%d,%d,\\fs45)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Mr.2"))
	end

-- #########################################################################################
-- ### Attaques de Ace | BarbeBlanche
-- #########################################################################################

	-- Dialogue: 0,0:07:58.05,0:07:58.65,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,460,\frz3,\frz0,\alpha&H80)}Higan{\r}
	-- Dialogue: 0,0:08:07.55,0:08:08.09,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(4,201,\frz3,\frz0,\alpha&H80)}En{\r}{\t(202,350,\frz3,\frz0,\alpha&H80)}kai{\r}
	-- Dialogue: 0,0:08:09.72,0:08:10.64,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,107,\frz3,\frz0,\alpha&H80)}Hiba{\r}{\t(107,450,\frz3,\frz0,\alpha&H80)}shira {\r}
	-- Dialogue: 0,0:08:25.95,0:08:26.68,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,460,\frz3,\frz0,\alpha&H80)}Hiken{\r}

	-- Dialogue: 0,0:19:28.98,0:19:30.35,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,107,\frz3,\frz0,\alpha&H80)}Shinka{\r} {\t(107,450,\frz3,\frz0,\alpha&H80)}Shiranui {\r}

	-- Dialogue: 0,0:20:00.26,0:20:01.65,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,460,\frz3,\frz0,\alpha&H80)}Juujika{\r}

	-- Dialogue: 0,0:22:06.89,0:22:09.01,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,460,\frz3,\frz0,\alpha&H80)}Dai Enkai{\r}
	-- Dialogue: 0,0:22:17.10,0:22:18.47,Usopp,,0000,0000,0000,,{\org(1000,1000)}{\r}{\t(0,460,\frz3,\frz0,\alpha&H80)}Entei{\r}
	
	function Ace_Fort(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(640,665)}"
				
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = "{\\r\\t(0," .. middle .. ",\\frx45\\bord10\\be1\\blur10\\3c&H00F3FF&)" 
			.. "\\t(" .. middle .. "," .. syl.end_time .. ",\\frx0\\bord2\\be0\\blur0\\3c&H0506B7&)"
			.. "}" .. syl.text_stripped
			newline = newline .. temp
		end
		subtitles.append(formatline(karaline, newline, "PortgasD"))
	end

-- #########################################################################################
-- ### Attaques de Kokoro
-- #########################################################################################

	-- TODO Merck
	-- Dialogue: 0,0:15:40.55,0:15:42.50,Kokoro,Kokoro,0000,0000,0000,,{\r}{\t(0,343,\bord5,\bord1,\frx-2,fry-2,\fs54,\1c&H6B36F5&)}Mer{\r}{\t(343,906,\bord5,\bord1,\frx-2,fry-2,\fs54,\1c&H6B36F5&)}maid {\r}{\t(905,1517,\bord5,\bord1,\frx-2,fry-2,\fs54,\1c&H6B36F5&)}Ki{\r}{\t(1517,1950,\bord5,\bord1,\frx-2,fry-2,\fs54,\1c&H6B36F5&)}ck

--- ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ - Marines
--- ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
	
-- #########################################################################################
-- ### Attaques de la Marine : Aokiji | Amiral de la Marine
-- #########################################################################################
	
	function Aokiji_Glace(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(640,665)\\t(\\alpha&HFF\\fsp50\\xbord15\\ybord5)}" .. karaline.text_stripped
		subtitles.append(formatline(karaline, newline, "Aokiji"))
	end
	
-- #########################################################################################
-- ### Attaques de la Marine : Kizaru | Amiral de la Marine
-- #########################################################################################
	
	function Kizaru_Simple(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(640,665)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx170\\fscy170)\\t(%d,%d,\\fscx100\\fscy100)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Kizaru"))
	end
	
-- #########################################################################################
-- ### Attaques de la Marine : Akainu | Amiral de la Marine
-- #########################################################################################
	
	function Akainu_Simple(karaline, subtitles)
		local temp = ""
		local newline = "{\\an5\\pos(640,665)}"
		for i = 1, karaline.kara.n do
			local syl = karaline.kara[i]
			local middle = syl.end_time-syl.duration/2
			temp = string.format("{\\r\\t(%d,%d,\\fscx170\\fscy170)\\t(%d,%d,\\fscx100\\fscy100)}%s", syl.start_time, middle, middle, syl.end_time, syl.text_stripped)		
			newline = newline .. temp		
		end
		subtitles.append(formatline(karaline, newline, "Akainu"))
	end
	
-- #########################################################################################
-- ### Attaques de la Marine : Coby
-- #########################################################################################
	
	-- TODO Soru
	-- Dialogue: 0,0:11:17.59,0:11:18.23,Coby,ATTAQUES,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,0,640,444)\t(0,250,\frz2)\t(250,500,\frz0)}Soru
	-- Dialogue: 0,0:11:17.59,0:11:18.23,Coby,ATTAQUES,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,444,640,480)\t(0,250,\frz-2)\t(250,500,\frz0)}Soru

	
-- #########################################################################################
-- ### Attaques de Lucci | Cipher Pol 9
-- #########################################################################################
-----------------------------------------------------------------------
-- Fonction Genkotsu
-- S'applique à :
--	
-----------------------------------------------------------------------
-- Surcharge : \org(1000,1000)
-- Sur chaque syllabe : \r\t(sylStart,sylEnd,\frz3,\frz0,\alpha&H80&)
-- Dialogue: 0,0:04:11.39,0:04:13.07,Lucci,,0000,0000,0000,,{\org(320,1000)\clip(0,0,280,600)\t(100,200,\frz3)\p1+} m 0 0 s 25 0 25 40 0 40 c {\p0}
-- Dialogue: 0,0:04:11.39,0:04:13.07,Lucci,,0000,0000,0000,,{\t(200,800,\3c&H2BDADD&)\t(1500,1501,\3c&H000000&)\t(1000,1200,\fscy150\fscx50)\t(1200,1400,\fscy100\fscx100)}Genkotsu
-----------------------------------------------------------------------
function Lucci_Genkotsu(karaline, subtitles)
	local c1 = "{\\org(320,1000)\\clip(0,0,280,600)\\t(100,200,\\frz3)\\p1+} m 0 0 s 25 0 25 40 0 40 c {\\p0}"
	local c2 = "{\\t(200,800,\\3c&H2BDADD&)\\t(1500,1501,\\3c&H000000&)\\t(1000,1200,\\fscy150\\fscx50)"
	.. "\\t(1200,1400,\\fscy100\\fscx100)}"
	karaline.comment = false
	karaline.actor = ""	
	karaline.style = "Lucci"
	
	karaline.layer = 1
	karaline.text = c1
	subtitles.append(karaline) -- Couche 1
	karaline.layer = 2
	karaline.text = c2 .. karaline.text_stripped
	subtitles.append(karaline) -- Couche 2
end


-----------------------------------------------------------------------
-- Fonction Meteor
-- S'applique à :
--	
-----------------------------------------------------------------------
-- Surcharge : \org(1000,1000)
-- Sur chaque syllabe : \r\t(sylStart,sylEnd,\frz3,\frz0,\alpha&H80&)
-- Dialogue: 0,0:04:13.85,0:04:15.65,Lucci,,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,0,640,444)\t(0,250,\frz2)\t(250,500,\frz0)}Meteor
-- Dialogue: 0,0:04:13.85,0:04:15.65,Lucci,,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,444,640,480)\t(0,250,\frz-2)\t(250,500,\frz0)}Meteor
-----------------------------------------------------------------------
function Lucci_Meteor(karaline, subtitles)
	local c1 = "{\\org(320,10000)\\pos(320,460)\\clip(0,0,640,444)\\t(0,250,\\frz2)\\t(250,500,\\frz0)}"
	local c2 = "{\\org(320,10000)\\pos(320,460)\\clip(0,444,640,480)\\t(0,250,\\frz-2)\\t(250,500,\\frz0)}"
	karaline.comment = false
	karaline.actor = ""	
	karaline.style = "Lucci"
	
	karaline.layer = 1
	karaline.text = c1 .. karaline.text_stripped
	subtitles.append(karaline) -- Couche 1
	karaline.layer = 2
	karaline.text = c2 .. karaline.text_stripped
	subtitles.append(karaline) -- Couche 2
end

-- Dialogue: 0,0:13:46.33,0:13:46.97,Lucci,,0000,0000,0000,,{\t(200,800,\3c&H2BDADD&)\t(1500,1501,\3c&H000000&)\t(1000,1200,\fscy150\fscx50)\t(1200,1400,\fscy100\fscx100)}Black
-- Dialogue: 0,0:13:47.04,0:13:48.41,Lucci,,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,0,640,444)\t(0,250,\frz2)\t(250,500,\frz0)}Hole
-- Dialogue: 0,0:13:47.04,0:13:48.41,Lucci,,0000,0000,0000,,{\org(320,10000)\pos(320,460)\clip(0,444,640,480)\t(0,250,\frz-2)\t(250,500,\frz0)}Hole

-- Dialogue: 0,0:15:54.85,0:15:55.95,Lucci,,0000,0000,0000,,{\t(200,800,\3c&H2BDADD&)\t(1500,1501,\3c&H000000&)\t(1000,1200,\fscy150\fscx50)\t(1200,1400,\fscy100\fscx100)}Liberation

-- Dialogue: 0,0:17:38.45,0:17:39.53,Lucci,,0000,0000,0000,,{\t(200,800,\3c&H2BDADD&)\t(1500,1501,\3c&H000000&)\t(1000,1200,\fscy150\fscx50)\t(1200,1400,\fscy100\fscx100)}Kourozu

-- #########################################################################################
-- ### Attaques de personnages lors de Hors Saisons
-- #########################################################################################

-- Comment: 0,0:09:18.91,0:09:20.77,Marine,Both,0000,0000,0000,,Love Throw
-- Dialogue: 3,0:09:18.91,0:09:19.58,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e
-- Dialogue: 2,0:09:18.91,0:09:19.58,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(320,435,350,510)\p2\alpha&H44&\fscx0\fscy0\t(0,670,\fscx100\fscy100)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 1,0:09:18.91,0:09:19.58,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(320,435,350,510)\p2\1a&hFF&\2a&hFF&\4a&hFF&\3c&HFFFFFF&\bord4\be1\fscx0\fscy0\t(0,670,\fscx100\fscy100)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 5,0:09:19.58,0:09:20.77,AtchinoCouple,Both,0000,0000,0000,,{\pos(320,445)\1c&HFFFFFF&\3c&H3333FF&\alpha&HFF&\1a&H00&\t(0,60,\1a&HFF&)\t(60,120,\1a&H00&\3a&H00&)\t(120,180,\1a&HFF&\3a&HFF&)\t(180,240,\1a&H00&)\t(240,300,\1a&HFF&)\t(300,360,\1a&H00&\3a&H00&)\t(360,420,\1a&HFF&\3a&HFF&)\t(420,480,\1a&H00&)\t(480,540,\1a&HFF&)\t(540,600,\1a&H00&\3a&H00&)\t(600,660,\1a&HFF&\3a&HFF&)\t(660,720,\1a&H00&)\t(720,780,\1a&HFF&)\t(780,840,\1a&H00&\3a&H00&)\t(840,900,\1a&HFF&\3a&HFF&)\t(900,960,\1a&H00&)\t(960,1020,\1a&HFF&)\t(1020,1080,\1a&H00&\3a&H00&)\t(1080,1140,\1a&HFF&\3a&HFF&)\t(1140,1200,\1a&H00&)\t(1200,1260,\1a&HFF&)}Throw
-- Dialogue: 4,0:09:19.58,0:09:20.77,AtchinoCouple,Both,0000,0000,0000,,{\an5\pos(350,510)\p2\alpha&H44&\t(0,1190,\alpha&HFF&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 1,0:09:19.58,0:09:20.77,AtchinoCouple,Both,0000,0000,0000,,{\an5\pos(350,510)\p2\1a&hFF&\2a&hFF&\4a&hFF&\3c&HFFFFFF&\bord4\be1\t(0,1190,\alpha&HFF&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 3,0:09:19.58,0:09:20.77,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(350,510,338,480)\p2\1a&hFF&\2a&hFF&\4a&hFF&\3c&HFFFFFF&\t(0,1190,\fscx60\fscy60\alpha&HFF&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 2,0:09:19.58,0:09:20.77,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(350,510,362,540)\p2\1a&hFF&\2a&hFF&\4a&hFF&\3c&HFFFFFF&\t(0,1190,\fscx140\fscy140\alpha&HFF&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}

-- Dialogue: 0,0:11:51.19,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,268,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}H{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}g{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}h {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}J{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}m{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}p {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}D{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}K{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}n {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}l{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}r{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}T{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}h{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}r{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}w
-- Dialogue: 2,0:11:51.19,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(26,460,600,460)\p2\alpha&H44&\fscx0\fscy0\t(0,670,\fscx100\fscy100)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 1,0:11:51.19,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(26,460,600,460)\p2\alpha&H44&\fscx0\fscy0\t(0,670,\fscx100\fscy100)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}

-- Dialogue: 0,0:18:40.06,0:18:41.50,Twins,Twins,0000,0000,0000,,{\r\t(0,180,\fs80)\t(180,360,\fs45\1c&H&H0708CA&)}Han {pos(320,460)}{\r\t(390,540,\fs80)\t(540,720,\fs45)\1c&H&H9E5431&}Pass
-- Dialogue: 0,0:20:57.69,0:20:59.33,Twins,Twins,0000,0000,0000,,{\r\t(0,210,\fs80)\t(210,390,\fs45)}Jiryoku {pos(390,570)}{\r\t(570,750,\fs80)\t(750,930,\fs45)\1c&H&H9E5431&}Han {pos(930,1110)}{\r\t(1110,1290,\fs80)\t(1290,1470,\fs45)}Pass

-- Comment: 3,0:11:51.19,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,200,\fscy110)\t(200,400,\fscy100)\t(400,600,\fscy110)\t(600,670,\fscy100)}H{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}g{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}h {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}J{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}m{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}p {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}D{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}K{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\(502,670,\frz0\fscy100)}n {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}l{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}r{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}T{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}h{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}r{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}w
-- ; Phase 1E - Effet 1s
-- Dialogue: 3,0:11:51.19,0:11:52.19,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,200,\fscy110)\t(200,400,\fscy100)\t(400,600,\fscy110)\t(600,670,\fscy100)}H{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}g{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}h {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}J{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}m{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}p {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}D{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}K{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\(502,670,\frz0\fscy100)}n {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}l{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}r{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}T{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}h{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}r{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}w
-- ; Phase 2E - Effet 1s
-- Dialogue: 3,0:11:52.19,0:11:53.19,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,200,\fscy110)\t(200,400,\fscy100)\t(400,600,\fscy110)\t(600,670,\fscy100)}H{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}g{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}h {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}J{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}m{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}p {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}D{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}K{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\(502,670,\frz0\fscy100)}n {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}l{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}r{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}T{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}h{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}r{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}w
-- ; Phase 3E - Effet 1s
-- Dialogue: 3,0:11:53.19,0:11:54.19,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,200,\fscy110)\t(200,400,\fscy100)\t(400,600,\fscy110)\t(600,670,\fscy100)}H{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}g{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}h {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}J{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}m{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}p {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}D{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}K{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\(502,670,\frz0\fscy100)}n {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}l{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}r{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}T{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}h{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}r{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}w
-- ; Phase 4E - Effet 1s
-- Dialogue: 3,0:11:54.19,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\org(-10000,445)\pos(320,445)\t(0,200,\fscy110)\t(200,400,\fscy100)\t(400,600,\fscy110)\t(600,670,\fscy100)}H{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}g{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}h {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}J{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}m{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}p {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}D{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}K{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}i{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\(502,670,\frz0\fscy100)}n {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}u{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}l{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}t{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}r{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}a {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}L{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}v{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}e {\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}T{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}h{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}r{\r\t(0,168,\fscy110)\t(168,335,\fscy100)\t(335,502,\fscy110)\t(502,670,\fscy100)}o{\r\t(0,168,\frz0.02\fscy90)\t(168,335,\frz0\fscy100)\t(335,502,\frz-0.02\fscy90)\t(502,670,\frz0\fscy100)}w

-- ; Phase 1C - Coeur
-- Dialogue: 2,0:11:51.19,0:11:51.69,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(26,433,121,510)\p2\alpha&HFF&\fscx0\fscy0\t(0,500,\fscx100\fscy100\alpha&H44&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 1,0:11:51.19,0:11:51.69,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(26,433,121,510)\p2\alpha&HFF&\fscx0\fscy0\t(0,500,\fscx100\fscy100\alpha&H44&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- ; Phase 2C - Coeur
-- Dialogue: 2,0:11:51.69,0:11:53.92,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(121,510,511,510)\p2\alpha&H44&}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 1,0:11:51.69,0:11:53.92,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(121,510,511,510)\p2\alpha&H44&}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- ; Phase 3C - Coeur
-- Dialogue: 2,0:11:53.92,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(511,510,623,433)\p2\alpha&H44&\t(0,500,\fscx0\fscy0\alpha&HFF&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}
-- Dialogue: 1,0:11:53.92,0:11:54.42,AtchinoCouple,Both,0000,0000,0000,,{\an5\move(511,510,623,433)\p2\alpha&H44&\t(0,500,\fscx0\fscy0\alpha&HFF&)}m 0 0 b 0 0 0 -50 -40 -50 c b -40 -50 -60 -50 -60 -100 c b -60 -100 -60 -150 -30 -150 c b -30 -150 0 -150 0 -100 c b 0 -100 0 -150 30 -150 c b 30 -150 60 -150 60 -100 c b 60 -100 60 -50 40 -50 c b 40 -50 0 -50 0 0 c{\p0}



aegisub.register_macro("[CP9]One Piece -> Effets", script_description, OnePieceStyle)

function OnePieceTitreDebutHaut(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do	
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i]
		meta, styles = karaskel.collect_head(subtitles, false)
		karaskel.preproc_line(subtitles, meta, styles, line)		
		line.actor = "titre"
		line.style = "Title"
		--line.text = "{\\an2\\pos(640,170)\\fad(1900,1700)}" .. string.upper(line.text_stripped)
		line.text = "{\\an5\\pos(640,95)\\fad(1900,1700)}" .. string.upper(line.text_stripped) -- Changement dû à Mirage-CP9 (yotsu)
		subtitles[i] = line		
	end
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("[CP9]One Piece -> Titre Debut Haut")
end
aegisub.register_macro("[CP9]One Piece -> Titre Debut Haut", script_description, OnePieceTitreDebutHaut)


function OnePieceTitreDebutBas(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do	
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i]
		meta, styles = karaskel.collect_head(subtitles, false)
		karaskel.preproc_line(subtitles, meta, styles, line)		
		line.actor = "titre"
		line.style = "Title"
		--line.text = "{\\an8\\pos(640,510)\\fad(1900,1700)}" .. string.upper(line.text_stripped)
		line.text = "{\\an5\\pos(640,605)\\fad(1900,1700)}" .. string.upper(line.text_stripped) -- Changement dû à Mirage-CP9 (yotsu)
		subtitles[i] = line
	end
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("[CP9]One Piece -> Titre Debut Bas")
end
aegisub.register_macro("[CP9]One Piece -> Titre Debut Bas", script_description, OnePieceTitreDebutBas)


function OnePieceTitreFinHaut(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do	
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i]
		meta, styles = karaskel.collect_head(subtitles, false)
		karaskel.preproc_line(subtitles, meta, styles, line)		
		line.actor = "titre"
		line.style = "Title"
		--line.text = "{\\an2\\pos(640,170)}" .. string.upper(line.text_stripped)
		line.text = "{\\an5\\pos(640,95)}" .. string.upper(line.text_stripped) -- Changement dû à Mirage-CP9 (yotsu)
		subtitles[i] = line		
	end
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("[CP9]One Piece -> Titre Fin Haut")
end
aegisub.register_macro("[CP9]One Piece -> Titre Fin Haut", script_description, OnePieceTitreFinHaut)


function OnePieceTitreFinBas(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do	
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i]
		meta, styles = karaskel.collect_head(subtitles, false)
		karaskel.preproc_line(subtitles, meta, styles, line)		
		line.actor = "titre"
		line.style = "Title"
		--line.text = "{\\an8\\pos(640,510)}" .. string.upper(line.text_stripped)
		line.text = "{\\an5\\pos(640,605)}" .. string.upper(line.text_stripped) -- Changement dû à Mirage-CP9 (yotsu)
		subtitles[i] = line		
	end
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("[CP9]One Piece -> Titre Fin Bas")
end
aegisub.register_macro("[CP9]One Piece -> Titre Fin Bas", script_description, OnePieceTitreFinBas)

function OnePieceYibisToCP9(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do	
		-- Cette ligne permet de récupérer la ligne en cours
		line = subtitles[i]
		meta, styles = karaskel.collect_head(subtitles, false)
		karaskel.preproc_line(subtitles, meta, styles, line)
		if (line.style == "Main") then line.style = "Default" end
		if (line.style == "Gold") then line.style = "Remember" end
		if (line.style == "Narrator") then line.style = "Voix_de_fond" end
		if (line.style == "Note") then line.style = "Indications" end
		if (line.style == "Thinking") then line.style = "pensée" end
		-- if (line.style == "Main") then line.style = "Default" end
		-- if (line.style == "Main") then line.style = "Default" end
		subtitles[i] = line		
	end
	-- Cette ligne permet d'annuler l'effet en utilisant le bouton "Undo"
	aegisub.set_undo_point("[CP9]One Piece -> Yibis->CP9")
end
aegisub.register_macro("[CP9]One Piece -> Yibis->CP9", script_description, OnePieceYibisToCP9)

