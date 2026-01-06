# 🌙 CLI To-Do List Manager | Dynamic Lua Engine

![Lua](https://img.shields.io/badge/Language-Lua-blue?style=for-the-badge&logo=lua)
![Status](https://img.shields.io/badge/Status-Functional-success?style=for-the-badge)
![Environment](https://img.shields.io/badge/Environment-CLI-lightgrey?style=for-the-badge)

Este projeto é um Gerenciador de Tarefas desenvolvido em **Lua**, focado em demonstrar conceitos de **arquitetura de dados dinâmica** e **validação de regras de negócio**. Diferente de listas estáticas, o sistema se comporta como um mini-ERP, permitindo que a estrutura das informações evolua conforme a necessidade do usuário.

---

## 💎 Diferenciais Técnicos

### 🧩 Esquema de Dados Mutável (Dynamic Schema)
O sistema permite a **injeção de campos em tempo de execução**. Através da função `Atribuir()`, o usuário pode adicionar novas chaves (como "Site", "Custo" ou "Responsável") que são automaticamente integradas ao fluxo de cadastro e consulta.

### 🛡️ Engine de Validação e Robustez
Implementação de camadas de proteção contra dados inconsistentes:
* **Validação de Data Real:** Algoritmo que valida se o dia, mês e ano existem no calendário gregoriano.
* **Pattern Matching:** Uso de expressões regulares nativas do Lua para garantir o formato `dd/mm/aaaa`.
* **Campos Mandatórios:** Proteção contra a remoção de chaves críticas como "Título" e "Conteúdo".

### 📊 Algoritmos de Ordenação Customizada
O módulo de consulta utiliza funções de alta ordem (`table.sort`) para organizar as informações:
* **Ordenação Alfabética:** Organização por título.
* **Peso Semântico:** Ordenação lógica por prioridade (Alta > Média > Baixa), mapeando valores simbólicos para pesos numéricos.

---

## 📸 Demonstração de Funcionalidades

| 🛠️ Cadastro e Validação | ➕ Atribuição Dinâmica |
| :--- | :--- |
| ![Cadastro](https://raw.githubusercontent.com/Bllprods/LUA/main/cad_funcional.png) | ![Atribuição](https://raw.githubusercontent.com/Bllprods/LUA/main/Atribuicao.png) |
| *Interface de cadastro com confirmação de dados.* | *Injetando novos campos na estrutura do sistema.* |

| ⚠️ Tratamento de Erros | 🔍 Filtros e Ordenação |
| :--- | :--- |
| ![Erros](https://raw.githubusercontent.com/Bllprods/LUA/main/cad_Erros.png) | ![Consulta](https://raw.githubusercontent.com/Bllprods/LUA/main/cons3.png) |
| *Proteção contra formatos de data inválidos.* | *Exibição organizada por prioridade e novos campos.* |

---

## 🛠️ Tecnologias e Conceitos Aplicados
* **Linguagem:** Lua 5.4.
* **Data Structures:** Tabelas de hashes aninhadas em arrays.
* **Controle de Fluxo:** Implementação de rótulos (`::goto::`) para tratamento de erros e redirecionamento de menu.
* **CRUD Operations:** Busca por strings, atualização seletiva e remoção segura de índices.

## 🚀 Como Executar
1. Certifique-se de ter o **Lua** instalado.
2. Clone este repositório.
3. Execute o arquivo principal:
```bash
lua listaToDo.lua