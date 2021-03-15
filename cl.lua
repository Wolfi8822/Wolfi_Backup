ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().group == nil and ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('wolfi:kod')
AddEventHandler('wolfi:kod', function(bk, s)
  if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
    local src = s
    local poziomkodu = bk
    local bktkst = "N/A"
    local kodyminecraft = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    local uliczka = GetStreetNameAtCoord(kodyminecraft.x, kodyminecraft.y, kodyminecraft.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local nazwaulicy = (GetStreetNameFromHashKey(uliczka))

    if poziomkodu == "0" then
      bktkst = "~r~~h~KOD 0"
    elseif poziomkodu == "1" then
      bktkst = "~g~KOD 1"
    elseif poziomkodu == "2" then
      bktkst = "~y~KOD 2"
    elseif poziomkodu == "3" then
      bktkst = "~r~~h~KOD 3"
    end

    ESX.ShowAdvancedNotification("AriviRP", bktkst, "~y~~h~Lokalizacja: ~s~"..nazwaulicy, CustomLogo, 7500, primary)
    if poziomkodu == "0" then
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
        Wait(900)
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
        SetNewWaypoint(kodyminecraft.x, kodyminecraft.y)
    end

    local gpsblip = AddBlipForCoord(kodyminecraft.x, kodyminecraft.y, kodyminecraft.z)
        SetBlipSprite(gpsblip,  280)
        SetBlipColour(gpsblip,  1)
        SetBlipAlpha(gpsblip, 250)
        SetBlipScale(gpsblip, 1.2)
        BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('# Kod '..poziomkodu..'')
    EndTextCommandSetBlipName(gpsblip)
    Citizen.Wait(60000)
    RemoveBlip(gpsblip)
  end
end)
