local ModInit = {
	Title = "Matti Old Mods",

	CreatedBy = "_matti, Soapy, LivingWithGames",
	Version = "1.0",
	PreBoot = false,

	Conflicts = {}
}

-- Dependencies : Hallgarth's Wheels
-- Content : MattiMegaCarPack, MattiD2RioChicagoSmall, Matti_FFStang67, 
-- 			 RetaliatorXS74, SkylineGTR04, Steelhumper(Flip-Car)

local RioSmall = "riosmall"
local ChicagoSmall = "chicagosmall"

local Old_Levels = {
	RioSmall,
	ChicagoSmall,
}

-- Remove "--" to make car selectable

local Old_Cars = {
	{"accordwgn", 				"Accord Wagon (EX)"},				-- Somewhat OK
	{"challengerxs", 			"'74 Retaliator XS"},				-- Perfect
	{"cop_regis_malt", 			"St Regis (Alt Version)"},			-- Somewhat OK
	-- {"cutterxs_malt", 			"'73 Cutter XS"},				-- Unnecessary
	-- {"d1_flair500classic",		"'68 Flair 500 Classic"}		-- Terrible
	-- {"d2_schutze400_82", 		"'78 Schutze 400 Classic"},		-- Terrible
	{"d3_bruiser69", 			"'69 Bruiser"},						-- OK
	{"d3_classic73", 			"'73 Classic"},						-- OK
	{"d3_eltoro", 				"'81 El Toro GT 500"},				-- OK
	{"d3_grande76", 			"'76 Grande Spedizione"},			-- OK
	{"d3_patriarchtycoon81", 	"'81 Tycoon"},						-- Somewhat OK
	{"d3_prowler80", 			"'80 Prowler Cop Car"},				-- Terrible
	{"d3_redlineV8_80", 		"'80 Redline V8"},					-- Somewhat OK
	{"d3_retaliator71", 		"'71 Retaliator"},					-- OK
	{"ff_fstang67", 			"'67 Ford Mustang Fastback"},		-- OK
	-- {"flipcar", 				"Steelhumper"},						-- Broken
	{"gta3_yardielobo", 		"'73 Yardie Lobo"},					-- Somewhat OK
	{"gtavc_cab83", 			"'83 VC Cab"},						-- Somewhat OK
	{"gtavc_civ83", 			"'83 VC LTD"},						-- Somewhat OK
	{"gtavc_pd83", 				"'83 VC Police"},					-- Somewhat OK
	{"r34sp", 					"'04 Skyline GT-R"},				-- Somewhat OK
	{"retaliatorSE72", 			"'72 Retaliator SE"},				-- Somewhat OK
}

-- initialization function
function ModInit:Init()

	EmitterSoundRegistry.Old_Engines 	= 	"scripts/sounds/Old_Engines.txt"

	for i,v in ipairs(Old_Cars) do
		table.insert(MenuCarsList, v)
	end

	--add to city list
	table.insert(MenuCityList, {"riosmall", "D2 Rio (Small)"})
	table.insert(MenuCityList, {"chicagosmall", "D2 Chicago (Small)"})
end

function ModInit:DeInit()

	EmitterSoundRegistry.Old_Engines 	= 	nil

	-- Deinit - Maps
	for i,v in ipairs(MenuCityList) do
	
		for ii,vv in ipairs(Old_Levels) do
			if v[1] == vv then
				--table.remove( MenuCityList, i)
				MenuCityList[i] = nil
			end
		end
	end

	-- Deinit - Cars - MIAMI
	for i,v in ipairs(MenuCarsList) do
	
		for ii,vv in ipairs(Old_Cars) do
			if vv[1] == v[1] then
				--table.remove( MenuCarsList, i)
				MenuCarsList[i] = nil
			end
		end
	end
end

return ModInit