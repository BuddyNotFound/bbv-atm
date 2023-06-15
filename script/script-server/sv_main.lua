local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("bbv:handlingMoney") 
AddEventHandler("bbv:handlingMoney", function(action, amount)
	local _source = source

	local Player = QBCore.Functions.GetPlayer(_source)
    local PlayerMoney = {
		bank = Player.PlayerData.money.bank,
		cash = Player.PlayerData.money.cash,
   }
	-- DO NOT CHANGE THIS
	if action == "withdraw" then
		if PlayerMoney.bank >= amount then
			-- CHANGE THIS 
			Player.Functions.RemoveMoney('bank', amount, "ATM - Withdraw")
			Wait(100)
			Player.Functions.AddMoney("cash", amount, "ATM - Withdraw")
			TriggerClientEvent("bbv:addLog", Player.source, 0, "Retrait de cash", amount)
		end
	end

	if action == "deposit" then
		if PlayerMoney.cash >= amount then
			-- CHANGE THIS 
			Player.Functions.RemoveMoney('cash', amount, "ATM - Deposit")
			Wait(100)
			Player.Functions.AddMoney("bank", amount, "ATM - Deposit")
			TriggerClientEvent("bbv:addLog", Player.source, 1, "Cash Deposit", amount)
		end
	end

	-- DO NOT CHANGE THIS
	TriggerClientEvent("bbv:sendMoney", _source, PlayerMoney.bank, PlayerMoney.cash)
end)