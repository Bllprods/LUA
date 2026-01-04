-- lua + love2d

local TelaW = 800
local TelaH = 600

function love.load()
    message = ""
    print("teste")
    local assetPaths = {
        barco = {"assets/barco.png", "assets/barco-lado.png"},
        fundo = "assets/mar.png",
        monstro = "assets/monstro.png",
        tiro = {"assets/tiro.png", "assets/fogo.png"},
        hud = "assets/vida.png"
    }

    assets = {
        barco = {love.graphics.newImage("assets/barco.png"), love.graphics.newImage("assets/barco-lado.png")},
        fundo = love.graphics.newImage("assets/mar.png"),
        monstro = love.graphics.newImage("assets/monstro.png"),
        tiro = {love.graphics.newImage("assets/tiro.png"), love.graphics.newImage("assets/fogo.png")},
        bote = {love.graphics.newImage("assets/tiro.png")},
        hud = love.graphics.newImage("assets/vida.png")
    }
    for __, v in pairs(assetPaths) do
        if type(v) == "table" then
            for __, v2 in pairs(v) do
                local info = love.filesystem.getInfo(v2)
                if not info then
                    message = "Falha ao carregar asset: " .. v2
                    break
                end
            end
        else 
            local info = love.filesystem.getInfo(v)
            if not info then
                message = "Falha ao carregar asset: " .. v
                break
            end
        end
    end

    if message == "" or message == nil then

        print("assets carregados! \n carregando dados...")
        tiros = {
            {img = assets.tiro[1], damage = 20, vel = 50},
            {img = assets.tiro[2], damage = 50, vel = 75}
        }

        barco = {
            img = {assets.barco[1], assets.barco[2]},
            hp = 3,
            vel = 5,
            sw = 0.5,
            sh = 0.5,
            y = TelaH/2 - 50,
            x = TelaW/2 - 50
        }
        ImgBarco = barco.img[1]

        monstros = {
            FeraMarinha = { img = assets.monstro, hp = 40, damage = 1, vel = 30, x = nil, y = nil}
        }
        if not(tiros == nil and barco == nil and monstros == nil) then
            print("dados inicializados!!")
        end
    else
        erros(message)
    end
end

function love.update()
    -- move

    if love.keyboard.isDown("down") then
        barco.y = barco.y + barco.vel
        ImgBarco = barco.img[1]
        barco.sh = 0.5
    elseif love.keyboard.isDown("up") then
        barco.y = barco.y - barco.vel
        ImgBarco = barco.img[1]
        barco.sh = -0.5
    end
    if love.keyboard.isDown("left") then
        barco.x = barco.x - barco.vel
        ImgBarco = barco.img[2]
        barco.sw = 0.5
    elseif love.keyboard.isDown("right") then
        barco.x = barco.x + barco.vel
        ImgBarco = barco.img[2]
        barco.sw = -0.5
    end

    -- spawn monstro
end

function love.draw()
    love.graphics.draw(assets.fundo, 0, 0, 0, 1, 0.5)

    love.graphics.draw(ImgBarco, barco.x, barco.y, 0, barco.sw, barco.sh)


end

function erros(msg)
    print("error: " .. msg)
    love.event.quit()
end