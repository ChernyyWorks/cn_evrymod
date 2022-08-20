function evrymod()
    Citizen.CreateThread(function()
        -- config
        local low_rpm = 0.7 -- Evry-mod rpm begin
        local boost_rpm = 0.85 -- RPM boost start
        local boost_multiplier = 3.0 -- Torque Multiplier
        local want_boost = true -- Need torque boost ?
        local want_popandbang = true -- Custom Exhaust required
        --
        while true do
            local mycar = GetVehiclePedIsIn(PlayerPedId(),false)
            if mycar == 0 then
                return
            end
            SetVehicleEngineTemperature(mycar,0) -- To keep it cold ^^
            if GetVehicleCurrentRpm(mycar) < low_rpm then
                SetVehicleCurrentRpm(mycar,1.0)
                SetVehicleTurboPressure(mycar,1.0) -- Stututu (Turbo required)
                if want_popandbang == true then
                    EnableVehicleExhaustPops(mycar,true)
                    SetVehicleCurrentRpm(mycar,7.0)
                end
            elseif GetVehicleCurrentRpm(mycar) > boost_rpm then
                if want_boost == true then
                    SetVehicleCheatPowerIncrease(mycar,boost_multiplier)
                end
            end
            Citizen.Wait(0)
        end
    end)
end

RegisterCommand("brapbrapbrap",function()
    evrymod()
end)