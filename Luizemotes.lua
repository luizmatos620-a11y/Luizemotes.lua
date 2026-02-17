-- LUIZ EMOTE MENU V1 - FOCO EM SERVIDOR (DELTA)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LUIZ EMOTE V1 🎭",
   LoadingTitle = "Injetando Animações Reais...",
   ConfigurationSaving = { Enabled = false },
   KeySystem = true,
   KeySettings = {
      Title = "Sistema de Chave",
      Subtitle = "Digite a senha do Luiz",
      Note = "Luiz menu ⚡",
      Key = {"Luizmenu2026"} 
   }
})

local lp = game:GetService("Players").LocalPlayer

-- --- ABA 1: EMOTES QUE TODOS VÊEM (PHYSICAL) ⚠️ ---
local TabReal = Window:CreateTab("Emotes Reais ⚠️", 4483362458)

TabReal:CreateToggle({
   Name = "Dança do Pião (Todos Vêem) 🌪️",
   CurrentValue = false,
   Callback = function(Value)
      _G.SpinDance = Value
      task.spawn(function()
         while _G.SpinDance do
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
               -- Move o RootPart de um jeito que o servidor replica
               lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(20), 0)
            end
            task.wait(0.01)
         end
      end)
   end,
})

TabReal:CreateToggle({
   Name = "Head Throw (Cabeça Doida) 🤯",
   CurrentValue = false,
   Callback = function(Value)
      _G.HeadDoido = Value
      task.spawn(function()
         while _G.HeadDoido do
            if lp.Character and lp.Character:FindFirstChild("Neck", true) then
               lp.Character:FindFirstChild("Neck", true).C0 = lp.Character:FindFirstChild("Neck", true).C0 * CFrame.Angles(math.rad(10), 0, 0)
            end
            task.wait()
         end
      end)
   end,
})

-- --- ABA 2: OVERRIDE DE ANIMAÇÃO 🏃 ---
local TabOverride = Window:CreateTab("Animações de Jogo 🏃", 4483362458)

TabOverride:CreateButton({
   Name = "Trocar Andar por Dança (Server?) 💃",
   Callback = function()
      -- Esse método tenta trocar a animação de 'Walk' padrão por uma ID de dança
      -- Se o Network Ownership for seu, os outros vêem você deslizando e dançando
      local playAnim = lp.Character.Animate.walk.WalkAnim
      playAnim.AnimationId = "rbxassetid://59174527" -- ID do Floss
      Rayfield:Notify({Title = "Sucesso", Content = "Ande para ver o resultado!", Duration = 3})
   end,
})

-- --- ABA 3: EMOTES CLIENT (PARA GRAVAR VÍDEO) 📱 ---
local TabClient = Window:CreateTab("Emotes Client 📱", 4483362458)

local function PlayClient(id)
   local anim = Instance.new("Animation")
   anim.AnimationId = "rbxassetid://"..id
   lp.Character.Humanoid:LoadAnimation(anim):Play()
end

TabClient:CreateButton({ Name = "Griddy", Callback = function() PlayClient("10916301311") end })
TabClient:CreateButton({ Name = "T-Pose", Callback = function() PlayClient("1588218885") end })
TabClient:CreateButton({ Name = "Monkey Dance", Callback = function() PlayClient("3333499508") end })

Rayfield:Notify({Title = "LUIZ EMOTES", Content = "Use a Aba Reais para os outros verem!", Duration = 5})

