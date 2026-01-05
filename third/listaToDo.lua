-- TO-DO-LIST

function Nova()
    local Lista = {};
    print("Criar nova anotacao:")
    print("Para tirar um campo de sua Lista digite 3 nele")
    ::reeCad::

    for i, Campo in ipairs(Campos) do
        local Invalido = false
        ::nextMark::
        if Campo == "prioridade" then
            ::InsPrio::
            if not Invalido then
                print(Campo .. ": (V = alta | M = normal  | B = baixa)")
                local Valor = string.lower(io.read())
                if Valor == "3" then
                    print("Campo ".. Campo .." Retirado")
                    goto nextMark
                elseif Valor ~= "m" and Valor ~= "v" and Valor ~= "b" then
                    Invalido = true;
                    goto InsPrio
                else
                    Lista[Campo] = Valor
                end
            elseif Invalido then
                print("Valor invalido para " .. Campo .. "!")
                Invalido = false
                goto InsPrio
            end

        elseif Campo == "data" then
            ::dataMark::
            print(Campo .. ": ")
            local Data = io.read()
            if Data == "3" then
                print("Campo ".. Campo .." Retirado")
                goto nextMark
            else
                local dia, mes, ano = Data:match("^(%d%d)/(%d%d)/(%d%d%d%d)$") -- validar formato
                if dia and mes and ano then
                    print("Data valida:" .. dia .. mes .. ano)
                    Lista[Campo] = Data
                else
                    print("Formato invalido! Use dd/mm/aaaa")
                    goto dataMark
                end
            end

        else
            ::novaMark::
            print(Campo .. ": ")
            local dado = io.read()
            if dado == "" then
                goto novaMark
            elseif dado == "3" then
                if Campo == "titulo" or Campo == "conteudo" then
                    print("este campo n pode ser retirado!")
                    goto novaMark
                else
                    print("Campo ".. Campo .." Retirado")
                    goto nextMark
                end
                
            else
                Lista[Campo] = dado
            end
        end
    end

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
    io.read("*l")  -- receber msg vazia pós-numero

    if conf == 1 then
        -- https://www.lua.org/manual/5.4/manual.html#6.6
        table.insert(Listas, Lista)-- inserir a nova lista no menu
        return true
    else
        print("Abortar Cadastro? (1 para sim, qualquer outro para nao)")
        local Confs = io.read("n")
        io.read("*l") -- limpeza
        if Confs == 1 then
            return
        else
            goto reeCad
        end
    end
end
function Alt()
    local indice
    local item
    local valido, encontrado = false, false
    ::Alt::
    if #Listas < 1 then
        print("sem Listas..")
        return
    end
    -- ipairs percorre índices numéricos em ordem crescente e para no primeiro nil
    -- pairs percorre todas as chaves (nomeadas ou numéricas), sem garantir ordem
    for i, itens in ipairs(Listas) do
        print(i .. ": " .. itens.titulo);
    end

    print("digite o titulo da lista que pretende alterar, ou 1 para abortar")
    local titulo = string.lower(io.read())
    if titulo == "1" then
        return
    end
    for i, itens in ipairs(Listas) do
        if string.lower(itens.titulo) == titulo then
            indice = i
            item = itens
            encontrado = true
            break
        end
    end
    if not encontrado then
        print("Lista nao encontrada")
        goto Alt
    else
        for linha, valor in pairs(item) do
            print(linha .. ": " .. valor)
        end

        print("Qual campo deseja alterar?")

        local listaCampos = table.concat(Campos, ", ")
        print("Opcoes: " .. listaCampos .. ":")
        local dado = string.lower(io.read())

        for i, itens in pairs(Campos) do
            if itens == dado then
                valido = true
            end
        end
        if valido then
            ::altdataMark::
            print("Alterando " .. dado .. "..")
            if dado == "data" then
                local Data = io.read()
                local dia, mes, ano = Data:match("^(%d%d)/(%d%d)/(%d%d%d%d)$") -- validar formato
                if dia and mes and ano then
                    print("Data valida:" .. dia .. mes .. ano)
                    Listas[indice][dado] = Data
                else
                    print("Formato invalido! Use dd/mm/aaaa")
                    goto altdataMark
                end
                print("Campo '" .. dado .. "' alterado com sucesso!")
                Listas[indice]["alterado em"] = os.date("%d/%m/%Y, %H:%M")
            elseif dado == "prioridade" then
                local Invalido = false
                ::InsPrio::
                if not Invalido then
                    print(dado .. ": (V = alta | M = normal  | B = baixa)")
                    local Valor = string.lower(io.read())
                    if Valor ~= "m" and Valor ~= "v" and Valor ~= "b" then
                        Invalido = true;
                        goto InsPrio
                    else
                        Listas[indice][dado] = Valor
                        print("Campo '" .. dado .. "' alterado com sucesso!")
                        Listas[indice]["alterado em"] = os.date("%d/%m/%Y, %H:%M")
                    end
                elseif Invalido then
                    print("Valor invalido para " .. dado .. "!")
                    Invalido = false
                    goto InsPrio
                end
            else
                Listas[indice][dado] = io.read()
                print("Campo '" .. dado .. "' alterado com sucesso!")
                Listas[indice]["alterado em"] = os.date("%d/%m/%Y, %H:%M")
            end
        elseif dado == "id" then
            print("este dado não pode ser alterado")
        else
            print("campo invalido")
            goto Alt
        end
    end
end
function Exc()
    print("excluir Lista:")
    if #Listas < 1 then
        print("sem Listas..")
        return
    end
    for i, itens in ipairs(Listas) do
        print(i .. ": " .. itens.titulo);
    end

    io.write("Digite o titulo da lista a ser excluida, ou 1 para Abortar: ")
    local titulo = string.lower(io.read())

    if titulo == "1" then
        return
    end
    for i, valor in ipairs(Listas) do
        if string.lower(valor.titulo) == titulo then
            table.remove(Listas, i)
            break
        end
    end
end
function Atribuir()
    ::Atri::
    print("atribuir novos valores a lista: ")
    print("Qual o nome do novo valor? Ou clique 1 para abortar ")
    local newValor = string.lower(io.read())
    if newValor == "1" then
        return
    end
    print("Confirmar adicao do campo " .. newValor .. "? (1 para sim, 2 para nao)")
    local respValor = io.read()
    if respValor == "1" then
        table.insert(Campos, newValor)
    else
        print("adicionar outro campo ou sair? (0 para sair ou 1 para adicionar)")
        local resp = io.read("n")
        io.read("*l") -- limpeza
        if resp == 1 then
            goto Atri
        else
            return
        end
    end
end
function Cons()
    print("consultando Listas ... ...")
    ::reCalc::
    print("filtros: ordem de criacao(1) || titulo(2) || prioridade(3) || 0 para sair")
    local response = tonumber(io.read("n"))
    io.read("*l") -- limpeza

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
    elseif response == 0 then
        return
    else
        print("Opcao invalida, re-calculando ...")
        goto reCalc
    end
    if #listaExibida ~= 0 then
        for chave, item in ipairs(listaExibida) do -- ipairs para respeitar o sort
            print(chave)
            for _, campo in ipairs(Campos) do
                if item[campo] then
                    local valor = item[campo]
                    if campo == "prioridade" then
                        if valor == "v" then
                            valor = "Alta"
                        elseif valor == "m" then
                            valor = "Media"
                        elseif valor == "b" then
                            valor = "Baixa"
                        end
                    end
                    print(campo .. ": " .. valor)
                end
            end
        end
    else
        print("Sem listas..\n 0 para voltar")
        if io.read("n") == 0 then
            io.read("*l") -- limpeza
            return true
        end
    end
end

print("Gerenciador de To-Do-List:")
Listas = {}
Campos = {
    "titulo",
    "data",
    "conteudo",
    "prioridade",
    "autor"
}

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
            print("acao invalida")
        end
    end
    -- rotulo para pular em caso de falha
    ::rotuloReiniciar::
end