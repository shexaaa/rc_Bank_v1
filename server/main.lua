ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)






RegisterServerEvent('rc_bank:deposit')
AddEventHandler('rc_bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent("pNotify:SendNotification", -1, {
			text = "<b style='color:white'>Bank</b><br />   <br /> You havent enought money to deposit.",
			type = "success",
			timeout = 1400,
			layout = "centerRight",
			queue = "left",
			sounds = {
			sources = {"notificationSFX.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
			volume = 0.2,
			conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
			}
		})
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))

		TriggerClientEvent("pNotify:SendNotification", -1, {
			text = "<b style='color:white'>Bank</b><br />   <br /> You deposit $" .. amount .. " on your bank account.",
			type = "success",
			timeout = 1400,
			layout = "centerRight",
			queue = "left",
			sounds = {
			sources = {"notificationSFX.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
			volume = 0.2,
			conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
			}
		})
	end
end)


RegisterServerEvent('rc_bank:balance')
AddEventHandler('rc_bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	money = xPlayer.getAccount('bank').money
	TriggerClientEvent('updateKonto', _source, money)
end)


RegisterServerEvent('rc_bank:withdraw')
AddEventHandler('rc_bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent("pNotify:SendNotification", -1, {
			text = "<b style='color:white'>Bank</b><br />   <br /> You havent enought money on you bank account.",
			type = "success",
			timeout = 1400,
			layout = "centerRight",
			queue = "left",
			sounds = {
			sources = {"notificationSFX.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
			volume = 0.2,
			conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
			}
		})
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)

		TriggerClientEvent("pNotify:SendNotification", -1, {
			text = "<b style='color:white'>Bank</b><br />   <br /> You withdraw $" .. amount .. " from your bank account.",
			type = "success",
			timeout = 1400,
			layout = "centerRight",
			queue = "left",
			sounds = {
			sources = {"notificationSFX.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
			volume = 0.2,
			conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
			}
		})
	end
end)



RegisterServerEvent('rc_bank:transfer')
AddEventHandler('rc_bank:transfer', function(transferIdInput, transferAmountInput)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(transferIdInput)
	local balance = 0

	if(zPlayer == nil or zPlayer == -1) then
	else
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		
		if tonumber(_source) == tonumber(transferIdInput) then
		else
			if balance <= 0 or balance < tonumber(transferAmountInput) or tonumber(transferAmountInput) <= 0 then
				TriggerClientEvent("pNotify:SendNotification", -1, {
					text = "<b style='color:white'>Bank</b><br />   <br /> You havent enought money or the PlayerId is wrong.",
					type = "success",
					timeout = 1400,
					layout = "centerRight",
					queue = "left",
					sounds = {
					sources = {"notificationSFX.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
					volume = 0.2,
					conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
					}
				})
			else
				xPlayer.removeAccountMoney('bank', tonumber(transferAmountInput))
				zPlayer.addAccountMoney('bank', tonumber(transferAmountInput))

				TriggerClientEvent("pNotify:SendNotification", -1, {
					text = "<b style='color:white'>Bank</b><br />   <br /> You transfer $" .. transferAmountInput .. " to PlayerId " .. transferIdInput .. ".",
					type = "success",
					timeout = 1400,
					layout = "centerRight",
					queue = "left",
					sounds = {
					sources = {"notificationSFX.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
					volume = 0.2,
					conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
					}
				})
			end
		end
	end
end)