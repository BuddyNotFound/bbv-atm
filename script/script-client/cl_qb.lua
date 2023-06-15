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


local Atm = {
	{prop = 'prop_atm_02'},
	{prop = 'prop_atm_03'},
	{prop = 'prop_fleeca_atm'},
	{prop = 'prop_atm_01'}
}

function InitiateBlip()
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
		Config.GetPlayerMoney()
		Wait(5000)
	end
end)

--THINGS YOU CAN EDIT 

RegisterCommand("form", function()
	bankForm = AtmMainMenu("ATM")
	curMenu = "mainMenu"
	display = true
end)

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

RegisterNetEvent("atm:sendMoney")
AddEventHandler("atm:sendMoney", function(money, cash)
	PlayerName = GetPlayerName(PlayerId())
	PlayerMoney = tonumber(money)
	PlayerCash = tonumber(cash)
end)

------------------------------------------------------------------------------------------------------


function IsNearATM()
	local objects = {}
	for _,v in pairs(Atm) do
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
------ EX (server-side , withdraw): TriggerClientEvent("atm:addLog", source, 1, "Cash withdraw", 2500) ------
-------------------------------------------------------------------------------------------------------------

---atm:addLog
---@param type number
---@param name string
---@param amount number
RegisterNetEvent("atm:addLog")
AddEventHandler("atm:addLog", function(type, name, amount)
	table.insert(transactionLog, 1, {type = type, name = name, amount = amount})
	SetResourceKvp("transactionLog", json.encode(transactionLog))
	if transactionLog[13] ~= nil and transactionLog[13] ~= {} then
		table.remove(transactionLog, 13)
	end
end)

----------------------------------------------------
------ THIS COMMAND IS JUST FOR DEVELOPPEMENT ------
----------------------------------------------------

if Config.EnableDev then
	RegisterCommand("money", function()
		print("Cash = " .. PlayerCash .. " | Bank = " .. PlayerMoney)
	end)
end
