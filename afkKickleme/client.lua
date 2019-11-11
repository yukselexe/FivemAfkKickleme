-- AFK KALMA SÜRESİNİ BURADAN AYARLAYIN (SANİYE TİPİNDE) --
afkKalmaSuresi = 1200

--Zamanın 3/4 ü dolduğunda uyarı gösterilsin mi?--
uyarma = true

--ANA KISIM DOKUNMAYINIZ--

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)   --oyuncunun verilerini topladım.--

			if currentPos == prevPos then
				if time > 0 then
					if uyarma and time == math.ceil(afkKalmaSuresi / 4) then
						TriggerEvent("chatMessage", "Uyarı", {255, 0, 0}, "^1Afk kalmanız halinde " .. time .. " dakika sonra kicklenebilirsiniz!") --uyarı kısmı
					end

					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				time = afkKalmaSuresi
			end

			prevPos = currentPos
		end
	end
end)
 --yukselexe tarafından yapılmıştır--