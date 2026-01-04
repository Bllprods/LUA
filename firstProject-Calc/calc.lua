-- io para manipular Terminal
-- https://www.lua.org/manual/5.4/manual.html#6.8

-- mini calculadora
print("Mini Calculadora em LUA:\n")
io.write("digite um numero: ")
local entrada1 = io.read("n")

io.write("digite o segundo numero: ")
local entrada2 = io.read("n")

local result
local operacao = {
    "+", "-", "*", "/"
};

function calcularTodos(entrada1, entrada2)
    for chave, valor in pairs(operacao) do
        local calc
        if valor == "+" then
            calc = entrada1 + entrada2
        elseif valor == "-" then
            calc = entrada1 - entrada2
        elseif valor == "*" then
            calc = entrada1 * entrada2
        elseif valor == "/" then
            calc = entrada1 / entrada2
        end
        result = tostring(entrada1) .. " " .. valor .. " " .. tostring(entrada2) .. " = " .. calc
        print(result)
    end
    dofile("select.lua")
end

if entrada1 ~= nil and entrada2 ~= nil then
    return calcularTodos(entrada1, entrada2)
end