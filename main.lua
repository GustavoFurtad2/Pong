local Largura = 1024
local Altura = 580

local Player1_Y = (Altura / 2) - 80 / 2
local Player2_Y = Player1_Y

local XBola, YBola = Largura / 2, Altura / 2
local VXBola, VYBola = 3, 3

local Player1_Direcao, Player2_Direcao

local Velocidade = 3
love.keypressed = function (keycode, scancode)
    if scancode == "w" then
        Player1_Direcao = "Up"
    elseif scancode == "s" then
        Player1_Direcao = "Down"
    end
    if scancode == "up" then
        Player2_Direcao = "Up"
    elseif scancode == "down" then
        Player2_Direcao = "Down"
    end
end

love.keyreleased = function (keycode, scancode)
    if scancode == "w" or scancode == "s" then
        Player1_Direcao = ""
    end
    if scancode == "up" or scancode == "down" then
        Player2_Direcao = ""
    end
end

love.update = function () -- Atualizar cada momento
   XBola = XBola + VXBola
   YBola = YBola + VYBola    

   if XBola < 0 or XBola > Largura then
        XBola = Largura / 2
        YBola = Altura / 2
        VXBola = -VXBola
        VYBola = -VYBola
   end
   if YBola < 0 or YBola > Altura then
        VYBola = -VYBola
   end

   if Player1_Direcao == "Up" then
    Player1_Y = Player1_Y - Velocidade
   elseif Player1_Direcao == "Down" then
    Player1_Y = Player1_Y + Velocidade
   end

   if Player2_Direcao == "Up" then
    Player2_Y = Player2_Y - Velocidade
   elseif Player2_Direcao == "Down" then
    Player2_Y = Player2_Y + Velocidade
   end

   if XBola >= 0 and XBola <= 20 and YBola >= Player1_Y and YBola <= Player1_Y + 80 then
        VXBola = -VXBola
        VYBola = -VYBola    
   elseif XBola >= Largura - 20 and XBola <= Largura and YBola >= Player2_Y and YBola <= Player2_Y + 80 then
    VXBola = -VXBola
    VYBola = -VYBola    
   end
end

love.draw = function () -- Desenhar cada frame
    love.graphics.rectangle("fill", 0, Player1_Y, 20, 80)
    love.graphics.rectangle("fill", Largura - 20, Player2_Y, 20, 80)
    love.graphics.circle("fill", XBola, YBola, 10)
end