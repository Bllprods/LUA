-- calculadora melhorada
-- io para manipular Terminal
-- https://www.lua.org/manual/5.4/manual.html#6.8

-- mini calculadora
print("Mini Calculadora em LUA:\n")
io.write("digite um numero: ")
local v1 = io.read("n")

io.write("digite o segundo numero: ")
local v2 = io.read("n")

io.read("*l") -- para ler qualquer caracter restante(enter, etc)

io.write("digite o calculo: ( +, -, *, /, porc): ")
local operacao = io.read() -- para ler apenas um caracter, quando vazio le o que esta escrito, sem o usuario digitar
local result

function calc(v1, v2, operacao)
    print(operacao)
    local calc
    if operacao == "+" then
        calculo = "adicao"
        calc = v1 + v2
    elseif operacao == "-" then
        calculo = "subtracao"
        calc = v1 - v2
    elseif operacao == "*" then
        calculo = "multiplicacao"
        calc = v1 * v2
    elseif operacao == "/" then
        calculo = "divisao"
        calc = v1 / v2
    elseif operacao == "porc" then
        calculo = "porcentagem"
        calc = (v1 / v2) * 100
    end
    result = calculo .. ":\n Valores: " .. tostring(v1) .. " " .. operacao .. " " .. tostring(v2) .. " = " .. calc
    print(result)
    dofile("select.lua")
end

if not(v1 == nil and v2 == nil and operacao == nil)then
    return calc(v1, v2, operacao)
end