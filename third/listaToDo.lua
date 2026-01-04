-- TO-DO-LIST

function Nova()
    print("Criar nova anotacao:")
    
    ::reeCad::

    print("Titulo: ")
    Lista["titulo"] = io.read()

    print("Data do Compromisso: ")
    Lista["data"] = io.read()

    print("Conteudo: ")
    Lista["conteudo"] = io.read()

    print("prioridade: (V = alta | M = normal  | B = baixa")
    Lista["prioridade"] = string.lower(io.read())

    print("Autor(opcional): ")
    Lista["autor"] = io.read()

    print("confirme os dados: ")
    for chave, valor in pairs(Lista) do
        if chave == "prioridade" and valor == "v" then
            valor = "alta"
        elseif chave == "prioridade" and valor == "m" then
            valor = "media"
        elseif chave == "prioridade" and valor == "b" then
            valor = "baixa"
        end
        print(chave .. ": " .. valor)
    end
    io.write("confirmar? 0 para voltar, 1 para continuar: ")
    local conf = io.read("n")
    io.read("*l")

    if conf == 1 then
        -- https://www.lua.org/manual/5.4/manual.html#6.6
        table.insert(Listas, Lista)
        return true
    else
        goto reeCad
    end
end
function Alt()
    if #Listas < 1 then
        print("sem Listas..")
        return
    end
    print("digite o titulo da lista que pretende alterar")
    local titulo = io.read()
    -- ipairs garante a sequencia crescente, o pairs é variavel

    for i, itens in pairs(Listas) do
        if itens.titulo == titulo then
            indice = i
            item = itens
        end
    end

    for linha, valor in pairs(item) do
        print(linha .. ": " .. valor)
    end

    print("qual campo deseja alterar?")
    io.write("Opções: Titulo, data, conteudo, prioridade e autor:")
    local dado = string.lower(io.read())

    if dado ~= "id" and dado ~= nil then
        Listas[indice][dado] = io.read()
        print("Campo '" .. dado .. "' alterado com sucesso!")
    elseif dado == "id" then
        print("este dado não pode ser alterado")
    else
        print("campo invalido")
    end
end
function Exc()
    print("excluir Lista:")
    if #Listas < 1 then
        print("sem Listas..")
        return
    end
    io.write("Digite o titulo da lista a ser excluida: ")
    local titulo = io.read()
    for i, valor in ipairs(Listas) do
        if valor.titulo == titulo then
            table.remove(Listas, i)
            break
        end
    end
end
function Atribuir()
    print("atribuir novos valores a lista: ")
    io.write("Qual o nome do novo valor? ")
    newValor = io.read()
    
end
function Cons()
    print("consultando Listas ... ...")
    ::reCalc::
    print("filtros: ordem de criação(1) || titulo(2) || prioridade(3)")
    local response = tonumber(io.read())
    

    -- insere o valor em outra para n alterar a original
    local listaExibida = {}
    for i, item in ipairs(Listas) do
        table.insert(listaExibida, item)
    end

    if response == 1 then
        -- não tem alteração
    elseif response == 2 then
        -- https://www.lua.org/manual/5.4/manual.html#6.6
        table.sort(listaExibida, function (a, b) --func. interna
            return a.titulo < b.titulo -- ordem alfabética pelo titulo
        end)
    elseif response == 3 then
        priValor = {v = 1, m = 2, b = 3}
        table.sort(listaExibida, function (a, b) --func. interna comparação
            return priValor[a.prioridade] < priValor[b.prioridade]-- ordem prioridade
        end)
    else
        print("Opção invalida, re-calculando ...")
        goto reCalc
    end
    if #listaExibida ~= 0 then
        for chave, valor in ipairs(listaExibida) do -- ipairs para respeitar o sort
            print(chave)
            for v1, valor in pairs(valor) do
                if v1 == "prioridade" then
                    if valor == "v" then
                        valor = "Alta"
                    elseif valor == "m" then
                        valor = "Média"
                    elseif valor == "b" then
                        valor = "Baixa"
                    end
                end
                print(v1 .. ": " .. valor)
            end
        end
    else
        print("Sem listas..\n 0 para voltar")
        if io.read("n") == 0 then
            return true
        end
    end
end

print("Gerenciador de To-Do-List:")
Listas = {}
Lista = {
    
}
print("Titulo: ")
    Lista["titulo"] = io.read()

    print("Data do Compromisso: ")
    Lista["data"] = io.read()

    print("Conteudo: ")
    Lista["conteudo"] = io.read()

    print("prioridade: (V = alta | M = normal  | B = baixa")
    Lista["prioridade"] = string.lower(io.read())

    print("Autor(opcional): ")
    Lista["autor"] = io.read()
while true do
    print("Acoes:\n Nova || Alterar || Excluir || Atribuir a || Consultar\n digite 0 para sair")
    io.write("Digite acao desejada: ")
    local request = string.lower(io.read())
    if request == nil or request == "" then
        print("Entrada invalida. Tente novamente.")
        -- -- https://www.lua.org/manual/5.4/manual.html#3.3
        -- goto rotuloReiniciar -- ir até o rotulo
    else
        if request == "nova" then
            Nova()
        elseif request == "alterar" then
            Alt()
        elseif request == "excluir" then
            Exc()
        elseif request == "atribuir" then
            Atribuir()
        elseif request == "consultar" then
            Cons()
        elseif request == "0" then
            dofile("select.lua")
        else
            goto rotuloReiniciar
        end
    end
    -- rotulo para pular em caso de falha
    ::rotuloReiniciar::
end