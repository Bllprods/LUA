-- escolher Projeto

print("PROJETOS: ")
io.write("Sair -- CODE 0\n")
io.write("calculadora 1:  -- CODE 1\n")
io.write("calculadora 2:  -- CODE 2\n")
io.write("TO-DO-LIST -- CODE 3\n")
io.write("\n")

local result = io.read();
result = tonumber(result)
if result == 1 then
    dofile("firstProject-Calc/calc.lua")
elseif result == 2 then
    dofile("second-Calc/sec.lua")
elseif result == 3 then
    dofile("third/listaToDo.lua")
elseif result == 4 then
    dofile("minijogo-love/main.lua")
elseif result == 0 then
    print("saindo .. ...")
    os.exit() -- executa a função "exit" do sistema operacional
end