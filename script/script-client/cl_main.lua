Config = {}
local QBCore = exports['qb-core']:GetCoreObject()
Config.ATM = {
	[0] = { -- Withdraw
		action = function(amount)
			-- UNLESS YOU HAVE A BETTER WAY, I ADVICE YOU TO JUST EDIT THE SERVER SIDE
			TriggerServerEvent("bbv:handlingMoney", "withdraw", amount)

		end
	},
	[1] = { -- Deposit
		action = function(amount)
			-- UNLESS YOU HAVE A BETTER WAY, I ADVICE YOU TO JUST EDIT THE SERVER SIDE
			TriggerServerEvent("bbv:handlingMoney", "deposit", amount)

		end
	},

}

Config.AtmProps = {
	{prop = 'prop_atm_02'},
	{prop = 'prop_atm_03'},
	{prop = 'prop_fleeca_atm'},
	{prop = 'prop_atm_01'}
}

Config.ATMBlip = {
	vector3(527.7776,-160.6609,56.13671),
	vector3(285.3485,142.9751,103.1623),
	vector3(-846.6537,-341.509,37.6685),
	vector3(-847.204,-340.4291,37.6793),
	vector3(-720.6288,-415.5243,33.97996),
	vector3(-1410.736,-98.92789,51.39701),
	vector3(-1410.183,-100.6454,51.39652),
	vector3(-712.9357,-818.4827,22.74066),
	vector3(-710.0828,-818.4756,22.73634),
	vector3(-660.6763,-854.4882,23.45663),
	vector3(-594.6144,-1160.852,21.33351),
	vector3(-596.1251,-1160.85,21.3336),
	vector3(-821.8936,-1081.555,10.13664),
	vector3(156.1886,6643.2,30.59372),
	vector3(173.8246,6638.217,30.59372),
	vector3(-282.7141,6226.43,30.49648),
	vector3(-95.87029,6457.462,30.47394),
	vector3(-97.63721,6455.732,30.46793),
	vector3(-132.6663,6366.876,30.47258),
	vector3(-386.4596,6046.411,30.47399),
	vector3(24.5933,-945.543,28.33305),
	vector3(5.686035,-919.9551,28.48088),
	vector3(296.1756,-896.2318,28.29015),
	vector3(296.8775,-894.3196,28.26148),
	vector3(1137.811,-468.8625,65.69865),
	vector3(1167.06,-455.6541,65.81857),
	vector3(1077.779,-776.9664,57.25652),
	vector3(289.53,-1256.788,28.44057),
	vector3(289.2679,-1282.32,28.65519),
	vector3(-1569.84,-547.0309,33.93216),
	vector3(-1570.765,-547.7035,33.93216),
	vector3(-1305.708,-706.6881,24.31447),
	vector3(-2071.928,-317.2862,12.31808),
	vector3(-2295.853,357.9348,173.6014),
	vector3(-2295.069,356.2556,173.6014),
	vector3(-2294.3,354.6056,173.6014),
	vector3(2558.324,350.988,107.5975),

	vector3(-1044.466,-2739.641,8.12406),
	vector3(-1091.887,2709.053,17.91941),
	vector3(-3144.887,1127.811,19.83804),
	vector3(1822.971,3682.577,33.26745),
	vector3(228.0324,337.8501,104.5013),
	vector3(158.7965,234.7452,105.6433),
	vector3(-57.17029,-92.37918,56.75069),
	vector3(357.1284,174.0836,102.0597),
	vector3(-1415.48,-212.3324,45.49542),
	vector3(-1430.663,-211.3587,45.47162),
	vector3(-1282.098,-210.5599,41.43031),
	vector3(-1286.704,-213.7827,41.43031),
	vector3(-1289.742,-227.165,41.43031),
	vector3(-1285.136,-223.9422,41.43031),
	vector3(-1110.228,-1691.154,3.378483),
	vector3(2564,2584.553,37.06807),
	vector3(1171.523,2703.139,37.1477),
	vector3(1172.457,2703.139,37.1477),
	vector3(1687.395,4815.9,41.00647),
	vector3(1700.694,6426.762,31.63297),

	vector3(89.81339,2.880325,67.35214),
	vector3(-867.013,-187.9928,36.88218),
	vector3(-867.9745,-186.3419,36.88218),
	vector3(-617.8035,-708.8591,29.04321),
	vector3(-617.8035,-706.8521,29.04321),
	vector3(-614.5187,-705.5981,30.224),
	vector3(-611.8581,-705.5981,30.224),
	vector3(-537.8052,-854.9357,28.27543),
	vector3(-526.7791,-1223.374,17.45272),
	vector3(-165.5844,234.7659,93.92897),
	vector3(-165.5844,232.6955,93.92897),
	vector3(-301.6573,-829.5886,31.41977),
	vector3(-303.2257,-829.3121,31.41977),
	vector3(-204.0193,-861.0091,29.27133),
	vector3(118.6416,-883.5695,30.13945),
	vector3(112.4761,-819.808,30.33955),
	vector3(111.3886,-774.8401,30.43766),
	vector3(114.5474,-775.9721,30.41736),
	vector3(-256.6386,-715.8898,32.7883),
	vector3(-259.2767,-723.2652,32.70155),
	vector3(-254.5219,-692.8869,32.57825),
	vector3(-27.89034,-724.1089,43.22287),
	vector3(-30.09957,-723.2863,43.22287),
	vector3(-1315.416,-834.431,15.95233),
	vector3(-1314.466,-835.6913,15.95233),
	vector3(-2956.848,487.2158,14.478),
	vector3(-2958.977,487.3071,14.478),
	vector3(-2974.586,380.1269,14),
	vector3(-3043.835,594.1639,6.732796),
	vector3(-3241.455,997.9085,11.54837),

	vector3(147.4731,-1036.218,28.36778),
	vector3(145.8392,-1035.625,28.36778),
	vector3(-1205.378,-326.5286,36.85104),
	vector3(-1206.142,-325.0316,36.85104),
	
}

Config.MoneyLevel = { ---DO NOT TOUCH TO THE KEY ENTRIES | "MAX" IS IF YOU ANT TO BE ABLE TO DEPOSIT ALL THE CASH
	[1] = 10, 
	[2] = 100,
	[3] = 1000,
	[5] = 5000,
	[6] = 10000,
	[7] = "max"
	
}

local scaleform, bankForm = nil
local display, curMenu, tempAmount, tempAction = false, nil
local transactionLog = {}
if GetResourceKvpString("transactionLog") ~= nil then transactionLog = json.decode(GetResourceKvpString("transactionLog")) else print("No Resource KVP String found") end
local PlayerMoney, PlayerCash = 0, 0
local withdrawAmount, depositAmount = {}, {}
for i = 1, 7 do 
	if i ~= 4 then 
		withdrawAmount[i] = 0
		depositAmount[i] = 0 
	end 
end

-- qb-target
if Cfg.UseTarget then
    CreateThread(function()
        exports['qb-target']:AddTargetModel(Cfg.ATMModels, {
            options = {
                {
                    event = 'bbv:openatm',
                    type = 'client',
                    icon = "fas fa-credit-card",
                    label = "Use ATM",
                },
            },
            distance = 1.5,
        })
    end)
end

AddEventHandler('bbv:openatm',function()
	PlayATMAnimation('enter')
	QBCore.Functions.Progressbar("accessing_atm", "Accessing ATM", 1500, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {}, {}, {}, function() -- Done
		if not IsPedInAnyVehicle(PlayerPedId(), false) then
			if IsNearATM() and not display then
				bankForm = AtmMainMenu("ATM")
				curMenu = "mainMenu"
				display = true
			end
		end
	end, function()
		QBCore.Functions.Notify("Failed!", "error")
	end)
end)

function InitiateBlip()
	if not Cfg.ATMBlip then return end
	for k, v in pairs(Config.ATMBlip) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 434)
		SetBlipScale(blip, 0.8)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("ATM")
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip, true)
		SetBlipColour(blip, 2)
	end
end
InitiateBlip()

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent("bbv:handlingMoney", action)
		Wait(5000)
	end
end)

--THINGS YOU CAN EDIT 

-- RegisterCommand("form", function()
-- 	bankForm = AtmMainMenu("ATM")
-- 	curMenu = "mainMenu"
-- 	display = true
-- end)

Citizen.CreateThread(function()
	while true do
		if display then
			DisableAllControlActions(0) 
			EnableControlAction(0, 249, true) -- ENABLING PUSH TO TALK CONTROL | SET TO FALSE IF YOU DO NOT USE INTEGRATED VOCAL SOLUTION
			EnableControlAction(0, 245, true) -- ENABLING OPEN CHAT CONTROL | SET TO FALSE IF YOU DO NOT USE FIVEM CHAT

			SetMouseCursorActiveThisFrame()
			SetNuiFocus(true, true)
			if IsDisabledControlJustPressed(0, 237) then -- LEFT MOUSE BUTTON : TO CLICK ON THE DIFFERENT BUTTON OF THE MENU
				BeginScaleformMovieMethod(bankForm, "SET_INPUT_SELECT")
				EndScaleformMovieMethod()
				BeginScaleformMovieMethod(bankForm, "GET_CURRENT_SELECTION")
				local value = EndScaleformMovieMethodReturn()
				while not IsScaleformMovieMethodReturnValueReady(value) do
					Wait(0)
				end
				local cb = GetScaleformMovieMethodReturnValueInt(value)
				print(cb)
				OpenSubMenu(cb)
			end
			if IsDisabledControlJustPressed(0, 200) then --ESCAPE : TO SET ESC AS CONTROL TO LEAVE THE ATM
				display = nil
				curMenu = nil
				SetScaleformMovieAsNoLongerNeeded(bankForm)
				bankForm = nil
			end
		else
			EnableAllControlActions(0)
			SetNuiFocus(false, false)
			Wait(1000)
		end
		Wait(5)
	end
end)

RegisterNetEvent("bbv:sendMoney")
AddEventHandler("bbv:sendMoney", function(money, cash)
	PlayerName = GetPlayerName(PlayerId())
	PlayerMoney = tonumber(money)
	PlayerCash = tonumber(cash)
end)

------------------------------------------------------------------------------------------------------


function IsNearATM()
	local objects = {}
	for _,v in pairs(Config.AtmProps) do
		table.insert(objects, v.prop)
	end
	
	local ped = GetPlayerPed(-1)
	local list = {}
	
	for _,v in pairs(objects) do
		local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 5.0, GetHashKey(v), false, true ,true)
		local dist = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(obj), true)
		table.insert(list, {object = obj, distance = dist})
		end
	
		local closest = list[1]
		for _,v in pairs(list) do
		if v.distance < closest.distance then
			closest = v
		end
		end
	
		local distance = closest.distance
		local object = closest.object
		

		if distance < 1.8 then
		return true
		end
end

RegisterCommand("openatm", function()
	if Cfg.UseTarget then return end 
	if not IsPedInAnyVehicle(PlayerPedId(), false) then
		if IsNearATM() and not display then
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
			display = true
		end
	end
end)

RegisterKeyMapping("openatm", "openatm", "keyboard", "e")

------------------------------------------------------------------------------------------------------
--------------------------------- UNDER THIS, YOU SHOULD'NT EDIT -------------------------------------
------------------- IF YOU DO, I RESERVE THE RIGHT TO NOT PROVIDE ANY SUPPORT ------------------------
------------------------------------------------------------------------------------------------------

function AddString(param) -- Function name from the
	BeginTextCommandScaleformString(param)
	EndTextCommandScaleformString()
end

function SetDataSlot(scaleform, slotId, string, amount)
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(tonumber(slotId))
	BeginTextCommandScaleformString(string)
	AddTextComponentFormattedInteger(amount, 1)
	EndTextCommandScaleformString()
	EndScaleformMovieMethod()
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if display then
			ShowCursorThisFrame()
			local mouseX = GetDisabledControlNormal(2, 239)
			local mouseY = GetDisabledControlNormal(2, 240)
			BeginScaleformMovieMethod(bankForm, "SET_MOUSE_INPUT")
			ScaleformMovieMethodAddParamFloat(mouseX)
			ScaleformMovieMethodAddParamFloat(mouseY)
			EndScaleformMovieMethod()
			Wait(2)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		if display then
			DrawScaleformMovie(bankForm, 0.5, 0.5, 0.8, 0.8, 255, 255, 255, 0, 0)
		end
		Wait(0)
	end
end)

function AtmMainMenu(form)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(form) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_SER")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_DIDM")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(2)
	AddString("MPATM_WITM")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(3)
	AddString("MPATM_LOG")
	EndScaleformMovieMethod()
	
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(4)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()


	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Naytox")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MENU")
	EndScaleformMovieMethod()

	return scaleform
end

function Withdraw(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local cfg = Config.MoneyLevel
	local scaleform = RequestScaleformMovie(scaleform) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_WITMT")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(4)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()
	
	for k, v in pairs(cfg) do
		if k <= 3 or k >= 5 then
			local amount = v
			if type(amount) == "number" then
				if PlayerMoney > amount then
					SetDataSlot(scaleform, k, "ESDOLLA", amount)
					withdrawAmount[k] = amount
				else
					amount = PlayerMoney
					SetDataSlot(scaleform, k, "ESDOLLA", amount)
					withdrawAmount[k] = amount
				end
			elseif type(amount) == "string" and amount == "max" then
				amount = PlayerMoney
				SetDataSlot(scaleform, k, "ESDOLLA", amount)
				withdrawAmount[k] = amount
			end
		end
	end

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString(PlayerName)
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_CASH_OPTIONS")
	EndScaleformMovieMethod()

	return scaleform
end

function Deposit(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local cfg = Config.MoneyLevel
	local scaleform = RequestScaleformMovie(scaleform) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_DITMT")
	EndScaleformMovieMethod()
		--[[ DO NOT PUT A VALUE HERE ]]
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(4)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()
	--[[ DO NOT PUT A VALUE HERE ]]

	for k, v in pairs(cfg) do
		if k <= 3 or k >= 5 then
			local amount = v
			if type(amount) == "number" then
				if PlayerCash > amount then
					SetDataSlot(scaleform, k, "ESDOLLA", amount)
					depositAmount[k] = amount
				else
					amount = PlayerCash
					SetDataSlot(scaleform, k, "ESDOLLA", amount)
					depositAmount[k] = amount
					break
				end
			elseif type(amount) == "string" and amount == "max" then
				amount = PlayerCash
				SetDataSlot(scaleform, k, "ESDOLLA", amount)
				depositAmount[k] = amount
			end
		end
	end

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString(PlayerName)
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_CASH_OPTIONS")
	EndScaleformMovieMethod()
	
	return scaleform
end

function OperationsLogs(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_LOG")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()

	if transactionLog[1] ~= nil and transactionLog[1] ~= {} then
		for i = 2, (#transactionLog+1), 1 do
			local i2 = i-1
			print("----------------------------> " ..i2)
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(i)
			ScaleformMovieMethodAddParamInt(transactionLog[i2].type) -- 0 FOR Debit | 1 for crédit
			ScaleformMovieMethodAddParamInt(transactionLog[i2].amount)
			ScaleformMovieMethodAddParamTextureNameString(transactionLog[i2].name)
			EndTextCommandScaleformString()
			EndScaleformMovieMethod()
		end
	end

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Naytox")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_TRANSACTIONS")
	EndScaleformMovieMethod()


	return scaleform
end

function PendingAction(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_PEND")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end

function ConfirmationMenu(scaleform, type, amount)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	if type == 0 then
		BeginTextCommandScaleformString("MPATC_CONFW")
	elseif type == 1 then
		BeginTextCommandScaleformString("MPATM_CONF")
	end
	AddTextComponentFormattedInteger(amount, 1)
	EndTextCommandScaleformString()
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MO_YES")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(2)
	AddString("MO_NO")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString(PlayerName)
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()
	return scaleform
end

function ErrorMenu(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	if curMenu == "errorMenu1" then
		AddString("MPATM_NODO")
	elseif curMenu == "errorMenu2" then
		AddString("MPATM_NODO2")
	end
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString(PlayerName)
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end

function SuccessMenu(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end
	
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_TRANCOM")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()


	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString(PlayerName)
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(PlayerMoney)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end

function OpenSubMenu(key)
	if curMenu == "mainMenu" then
		if key == 1 then
			if PlayerCash > 0 then
				SetScaleformMovieAsNoLongerNeeded(bankForm)
				bankForm = Deposit("ATM")
				curMenu = "subMenu"..key
			else
				bankForm = PendingAction("ATM")
				Wait(2000)
				curMenu = "errorMenu1"
				SetScaleformMovieAsNoLongerNeeded(bankForm)
				bankForm = ErrorMenu("ATM")
			end
		elseif key == 2 then
			if PlayerMoney > 0 then
				SetScaleformMovieAsNoLongerNeeded(bankForm)
				bankForm = Withdraw("ATM")
				curMenu = "subMenu"..key
			else
				bankForm = PendingAction("ATM")
				Wait(2000)
				curMenu = "errorMenu2"
				SetScaleformMovieAsNoLongerNeeded(bankForm)
				bankForm = ErrorMenu("ATM")
			end
		elseif key == 3 then
			bankForm = OperationsLogs("ATM")
			curMenu = "subMenu"..key
		elseif key == 4 then
			display = false
			PlayATMAnimation('exit')
			curMenu = nil
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = nil
			Wait(1000)
		end
	elseif curMenu == "subMenu1" or curMenu == "subMenu2" then
		if key == 4 then
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
		else
			if curMenu == "subMenu1" then
				tempAmount = depositAmount[key]
				tempAction = 1
				bankForm = ConfirmationMenu("ATM", 1, tempAmount)
				curMenu = "confirmationSM"
			elseif curMenu == "subMenu2" then
				tempAmount = withdrawAmount[key]
				tempAction = 0
				bankForm = ConfirmationMenu("ATM", 0, tempAmount)
				curMenu = "confirmationSM"
			end
		end
	elseif curMenu == "subMenu3" then
		if key == 1 then
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
		end
	elseif curMenu == "errorMenu1" then
		if key == 1 then
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
		elseif key == 2 then
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = Withdraw("ATM")
			curMenu = "subMenu2"
		end
	elseif curMenu == "errorMenu2" then
		if key == 1 then
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
		elseif key == 2 then
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = Deposit("ATM")
			curMenu = "subMenu1"
		end
	elseif curMenu == "confirmationSM" then
		if key == 1 then
			local amount, action =  tempAmount, tempAction
			Config.ATM[action].action(amount)
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = SuccessMenu("ATM")
			curMenu = "successMenu"
			tempAmount, tempAction = nil, nil
		elseif key == 2 then
			tempAmount, tempAction = nil, nil
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
		end
	elseif curMenu == "successMenu" then
		if key == 1 then
			tempAmount, tempAction = nil, nil
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
			
		elseif key == 2 then
			tempAmount, tempAction = nil, nil
			SetScaleformMovieAsNoLongerNeeded(bankForm)
			bankForm = AtmMainMenu("ATM")
			curMenu = "mainMenu"
		end
	end
end

-------------------------------------------------------------------------------------------------------------
----------------- THIS IS THE EVENT YOU HAVE TO PUT WHEN YOU WANT AN OPERATION TO BE LOGED ------------------
------ EX (server-side , withdraw): TriggerClientEvent("bbv:addLog", source, 1, "Cash withdraw", 2500) ------
-------------------------------------------------------------------------------------------------------------

---bbv:addLog
---@param type number
---@param name string
---@param amount number
RegisterNetEvent("bbv:addLog")
AddEventHandler("bbv:addLog", function(type, name, amount)
	table.insert(transactionLog, 1, {type = type, name = name, amount = amount})
	SetResourceKvp("transactionLog", json.encode(transactionLog))
	if transactionLog[13] ~= nil and transactionLog[13] ~= {} then
		table.remove(transactionLog, 13)
	end
end)

----------------------------------------------------
------ THIS COMMAND IS JUST FOR DEVELOPPEMENT ------
----------------------------------------------------

-- if Config.EnableDev then
-- 	RegisterCommand("money", function()
-- 		print("Cash = " .. PlayerCash .. " | Bank = " .. PlayerMoney)
-- 	end)
-- end


function PlayATMAnimation(animation)
    local playerPed = PlayerPedId()
    if animation == 'enter' then
        RequestAnimDict('amb@prop_human_atm@male@enter')
        while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do
            Wait(0)
        end
        TaskPlayAnim(playerPed, 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end

    if animation == 'exit' then
        RequestAnimDict('amb@prop_human_atm@male@exit')
        while not HasAnimDictLoaded('amb@prop_human_atm@male@exit') do
            Wait(0)
        end
        TaskPlayAnim(playerPed, 'amb@prop_human_atm@male@exit', "exit", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end
end