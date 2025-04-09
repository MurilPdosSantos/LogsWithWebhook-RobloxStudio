local Console = {
	["HttpService"] = game:GetService("HttpService"),
	["WebHook"] = "https://webhook.lewisakura.moe/api/webhooks/1238337185766178876/k033SOWqC9rd3PpPle6a48s-_zbqptJd4IaSv0QqAA9BfGYdOUQmwGyeQwS8KIOwSgSl"
}

local nowHour = os.date("*t", os.time())


function Console.CreateHookMassage(url, title, message, color)
	
	local data = {
		['content'] = 
			string.format("Time: %02d:%02d:%02d", nowHour.hour, nowHour.min, nowHour.sec).." || "..
			string.format("Data: %02d/%02d/%04d", nowHour.day, nowHour.month, nowHour.year),
		['embeds'] = {{
			['title'] = title,
			['description'] = message,
			['type'] = 'rich',
			['color'] = color
		}}
	}
	
	local dataf = Console.HttpService:JSONEncode(data)
	
	local sucess, result = pcall(function()
		Console.HttpService:PostAsync(url, dataf, Enum.HttpContentType.ApplicationJson)
	end)
	
	if sucess then
		print"sucess sendded webhook"
	else
		warn("failed send webhook ", result)
	end
end

function Console:Log(Object, Message)
	print(Object.Name.." "..Message)

	Console.CreateHookMassage(
		Console.WebHook,
		"[INFO] "..Object.Name.."'s Log",
		Message,
		tonumber(0x02e1f5)
	)
end

function Console:Error(Object, Message, ERROR_CODE)
	
	if Object ~= nil then
		
		Console.CreateHookMassage(
			Console.WebHook,
			"#"..ERROR_CODE.." at "..Object.Name,
			Message,
			tonumber(0xcc080e)
		)
		
		error(Object.Name.." "..Message.." Code: "..ERROR_CODE)
		
	else
		
		Console.CreateHookMassage(
			Console.WebHook,
			"#"..ERROR_CODE.." at "..Message,
			Message,
			tonumber(0xcc080e)
		)
		
		error(Message.." Code: "..ERROR_CODE)
	end
end

return Console
