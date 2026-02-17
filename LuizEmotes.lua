-- NOVO SCRIPT SEPARADO: LUIZ EMOTE V1 🎭
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LUIZ EMOTE V1 🎭",
   LoadingTitle = "Iniciando Estúdio de Animação...",
   LoadingSubtitle = "por Luiz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LuizEmotesData", -- Pasta diferente do outro menu para não dar conflito
      FileName = "EmotesConfig"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Sistema de Chave",
      Subtitle = "Digite a senha do Luiz",
      Note = "Luiz menu ⚡ (Emotes)",
      FileName = "LuizKeyEmotes",
      SaveKey = true,
      Key = {"Luizmenu2026"} 
   }
})

local lp = game:GetService("Players").LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Função para rodar animações
local function PlayAnim(id)
   local anim = Instance.new("Animation")
   anim.AnimationId = "rbxassetid://"..id
   local load = hum:LoadAnimation(anim)
   load:Play()
end

-- --- ABA 1: EMOTES (CLIENT SIDE) 💃 ---
local TabEmotes = Window:CreateTab("Emotes 💃", 4483362458)

TabEmotes:CreateLabel("Estes emotes apenas você vê (Client Side)")

TabEmotes:CreateButton({
   Name = "Griddy",
   Callback = function() PlayAnim("10916301311") end,
})

TabEmotes:CreateButton({
   Name = "Floss",
   Callback = function() PlayAnim("59174527") end,
})

TabEmotes:CreateButton({
   Name = "Dab",
   Callback = function() PlayAnim("248263260") end,
})

-- --- ABA 2: ANIMAÇÕES DE MOVIMENTO 🏃 ---
local TabAnim = Window:CreateTab("Animações 🏃", 4483362458)

TabAnim:CreateButton({
   Name = "Idle: Zumbi",
   Callback = function() PlayAnim("616159544") end,
})

TabAnim:CreateButton({
   Name = "Idle: Ninja",
   Callback = function() PlayAnim("658822532") end,
})

-- --- ABA 3: MOVIMENTOS REAIS (TODOS VÊEM) ⚠️ ---
local TabReal = Window:CreateTab("Movimentos Reais ⚠️", 4483362458)

TabReal:CreateLabel("Estes movimentos o servidor inteiro vê!")

TabReal:CreateToggle({
   Name = "Spin Bot (Giro de Dança)",
   CurrentValue = false,
   Callback = function(Value)
      _G.SpinDance = Value
      task.spawn(function()
         while _G.SpinDance do
            lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(20), 0)
            task.wait()
         end
      end)
   end,
})

TabReal:CreateToggle({
   Name = "Levitação Glitch (Sobe e Desce)",
   CurrentValue = false,
   Callback = function(Value)
      _G.FloatDance = Value
      task.spawn(function()
         while _G.FloatDance do
            hum.HipHeight = 1.5 + math.sin(tick()*8) * 1.5
            task.wait()
         end
         hum.HipHeight = 0
      end)
   end,
})

-- --- ABA 4: CONFIGURAÇÕES ⚙️ ---
local TabConfig = Window:CreateTab("Config ⚙️", 4483362458)

TabConfig:CreateButton({
   Name = "Fechar Menu ❌",
   Callback = function() Rayfield:Destroy() end
})

Rayfield:Notify({Title = "NOVO MENU CARREGADO", Content = "Luiz Emote V1 pronto!", Duration = 5})

