ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterCommand("kod", function(source, args, rawCommand)
	local s = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		if xPlayer.job.name == 'police' then
			local bkLvl = args[1]
			if not bkLvl then
                TriggerClientEvent("esx:showAdvancedNotification", source, "AriviRP", "Wsparcie", "Proszę podać poziom kodu: ~r~~h~0~s~, ~r~~h~1~s~, ~r~~h~2~s~, ~r~~h~3~s~.", CustomLogo, 7500, primary)
			elseif bkLvl == "0" then
			  TriggerClientEvent("wolfi:kod", -1, bkLvl, s)
			elseif bkLvl == "1" then
			  TriggerClientEvent("wolfi:kod", -1, bkLvl, s)
            elseif bkLvl == "2" then
                TriggerClientEvent("wolfi:kod", -1, bkLvl, s)
            elseif bkLvl == "3" then
                TriggerClientEvent("wolfi:kod", -1, bkLvl, s)
			elseif bkLvl ~= "0" or bkLvl ~= "1" or bkLvl ~= "2" or bkLvl ~= "3" then
                TriggerClientEvent("esx:showAdvancedNotification", source, "AriviRP", "Wsparcie", "Nieprawidłowy poziom kodu. \n ~r~~h~0~s~, ~r~~h~1~s~, ~r~~h~2~s~, ~r~~h~3~s~.", CustomLogo, 7500, dowod)
			end
		end
	end
  end)