gg.setVisible(false)
gg.toast("🔴 KING TIRRZ v1.3 LOADED 🔴")
gg.sleep(300)

-- ======================================================
-- 👇👇👇👇 PAINEL SENHAS E USUÁRIO 👇👇👇👇
-- ======================================================

-- Tabela de senhas com configurações individuais
local senhasValidas = {
    -- 🟢 ÚNICA KEY ATIVA (Expira no futuro: 18/07/2026)
    ["TIRR18"] = {
        usuario = "PREMIUM",
        dispositivos = "1",
        criado = "30/06/2026 H19:00",
        ano = 2028, mes = 7, dia = 20, hora = 10, min = 00
    }, 
    --=====================================================
    ["ANDRE"] = {
        usuario = "PREMIUM",
        dispositivos = "1",
        criado = "01/01/2026 H08:00",
        ano = 2026, mes = 7, dia = 9, hora = 21, min = 00 
    },
   -- =====================================================
 ["KINGTIR"] = {
        usuario = "PREMIUM",
        dispositivos = "2",
        criado = "01/01/2026 H08:00",
        ano = 2026, mes = 7, dia = 8, hora = 20, min = 00 
    },
  -- =====================================================  
["AGUNG"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 7, dia = 14, hora = 22, min = 00
    },
  -- ====================================================
  ["FUNIX"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 7, dia = 12, hora = 10, min = 00
    },
  -- ====================================================
  ["LOPEZZZ"] = {
        usuario = "PREMIUM", 
        dispositivos = "0", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 7, dia = 12, hora = 01, min = 20
    },
   -- ====================================================
 ["SONETA"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2030, mes = 7, dia = 6, hora = 10, min = 00
    },
       -- ====================================================
 ["BANDIT"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 7, dia = 12, hora = 13, min = 00
    },
       -- ====================================================
 ["MARSEL"] = {
        usuario = "PREMIUM", 
        dispositivos = "0", 
        criado = "01/01/2026 H00:00", 
        ano = 2029, mes = 7, dia = 6, hora = 23, min = 00
    },
  -- =====================================================
["ICHTIAR"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 7, dia = 4, hora = 10, min = 00
    },
 -- =======================================================  
 ["PENPEN"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 6, dia = 30, hora = 00, min = 00
    },
    -- =======================================================  
 ["FAJRI"] = {
        usuario = "PREMIUM", 
        dispositivos = "1", 
        criado = "01/01/2026 H00:00", 
        ano = 2026, mes = 7, dia = 6, hora = 20, min = 00
    },
 -- =======================================================
  ["ROXIO"] = {
        usuario = "KELUARGA", 
        dispositivos = "99", 
        criado = "01/01/2026 H00:00", 
        ano = 2027, mes = 1, dia = 1, hora = 00, min = 00
    }
}
-- ======================================================
-- 👆👆👆👆 PAINEL SENHAS E USUÁRIO 👆👆👆👆
-- ======================================================

-- Função principal de login
function realizarLogin()
    local entrada = gg.prompt({"🔑 MASUKKAN KEY ANDA:"}, nil, {"text"})
    
    -- Verifica se o usuário cancelou ou não digitou nada
    if not entrada then 
        gg.alert("❌ MOD MENU DI BATALKAN.")
        os.exit() 
    end
    
    local senhaDigitada = entrada[1]
    local dadosSenha = senhasValidas[senhaDigitada]
    
    -- Verifica se a senha existe na tabela
    if dadosSenha then
        -- Pega o timestamp do momento atual do celular
        local dataAtual = os.time()
        
        -- Mapeia os dados da tabela para as propriedades que o os.time exige
        local dataExpiracao = os.time({
            year = dadosSenha.ano, 
            month = dadosSenha.mes, 
            day = dadosSenha.dia, 
            hour = dadosSenha.hora, 
            min = dadosSenha.min, 
            sec = 0
        })
        
        -- Formata a exibição visual das datas no alerta
        local txtDia = string.format("%02d", dadosSenha.dia)
        local txtMes = string.format("%02d", dadosSenha.mes)
        local txtHora = string.format("%02d", dadosSenha.hora)
        local txtMin = string.format("%02d", dadosSenha.min)
        local dataExpiraFormatada = txtDia .. "/" .. txtMes .. "/" .. dadosSenha.ano .. " H" .. txtHora .. ":" .. txtMin
        
        -- Compara se o horário do celular passou do prazo de validade
        if dataAtual > dataExpiracao then
            gg.alert("❌ KEY BERAKHIR PADA: " .. dataExpiraFormatada)
            os.exit()
        else
            -- Alerta personalizado mostrando as informações da key usada
            gg.alert(" 👤 PENGGUNA: " .. dadosSenha.usuario .. 
                     "\n 🔑 KEY: " .. senhaDigitada .. 
                     "\n 💻 PERANGKAT: " .. dadosSenha.dispositivos .. 
                     "\n 📆 DIBUAT: " .. dadosSenha.criado .. 
                     "\n 📆 BERAKHIR: " .. dataExpiraFormatada .. " \n")
                     
            menuPrincipal() 
        end
    else
        gg.alert("❌ Kata sandi salah! Skrip akan ditutup..")
        os.exit()
    end
end

function menuPrincipal()
    gg.toast("🔴 KING TIRRZ v1.3 LOADED 🔴")
    print("🔴 KING TIRRZ v1.3 BERHASIL DI LOADED 🔴")
end

realizarLogin()

gg.alert("MOD MENU RIO RISE BY KING TIRR MODZ , SELAIN 085138961370 PENIPUAN ‼️")

-- ==========================================
-- DATABASE TELEPORT GPS
-- ==========================================
-- ==========================================
-- VARIABEL GPS TARGET (DYNAMIC)
-- ==========================================
local TEMPO_ESPERA_PADRAO = 6
local TEMPO_ESPERA_FINAL = 1
local SPEED_FAZENDA = 0.5
local SPEED_MINA = 6.0
local DIST_MIN = 1.5

-- ==========================================
-- VARIÁVEIS DO FARM ÔNIBUS
-- ==========================================
local farmFazendaTerraAtivo = false
local rotaFazendaTerra = {}
local checkpointAtualTerra = 1
local ciclosTerra = 0
local coletasTerra = 0

local pontoSuperficie = {x = 193.703, y = 10.735, z = -2475.041}

local farmMinaBlabeidiAtivo = false
local rotaMinaBlabeidi = {}
local checkpointAtualMina = 1
local ciclosMina = 0
local coletasMina = 0

local rotaPadraoMinaBlabeidi = {
    {nome = "🚪 POSISI 1", x = 19.4, y = 1012.2, z = 859.3},
    {nome = "🔄 KORIDOR 1", x = 21.1, y = 1012.1, z = 833.7},
    {nome = "⛏️ POSISI 3", x = 23.2, y = 1009.6, z = 807.9},
    {nome = "💎 POSISI 4", x = 25.5, y = 1008.3, z = 785.2},
    {nome = "💎 JUAL", x = 27.8, y = 1007.8, z = 765.4},
    {nome = "🔄 KEMBALI", x = 23.0, y = 1010.0, z = 810.0},
    {nome = "🚪 KELUAR", x = 19.4, y = 1012.2, z = 859.3}
}

local pontoSeguroMina = {x = 19.4, y = 1050.0, z = 859.3}

local enderecosY_Onibus = {}
local enderecosCheckpoint = {}
local enderecosCompletos_Onibus = {}
local farmOnibusAtivo = false
local itensNaLista_Onibus = {}
local playerObtido_Onibus = false
local onibusObtido = false
local checkpointObtido = false

local GPS = {
    qword = "8534161175060509200",
    offX = 0x20,
    offZ = 0x1C,
    offY = 0x18,
    address = nil,
    running = false
}
local ENDERECO_BASE = nil
local PRIMEIRA_BUSCA = "-333.24081420898;-1277.98217773438;10.36108493805"
local SEGUNDA_BUSCA = '"-750.6337890625;-1311.76403808594;18.96370315552"'

local active = false
local selectedSpeed = 5 -- Kecepatan awal default untuk Slider
local savedAddr = nil
local savedValue = nil

local addrZ, addrX, addrY = nil, nil, nil
local BASE = -4411604134709397577
local OX, OY, OZ = 0x4, 0x8, 0x0

local gps_qword = "7233187898168705024"
local gps_offZ, gps_offX, gps_offY = 0x14, 0x10, 0xC
local gpsAtivo = false

local speedWalkCache = { addresses = nil, lastTarget = "3.14159274101" }
local teleportPoints = {

    -- TELEPORT GPS
    {name = "🌟 TEMPAT DUEL", x = -670.744, y = 12.086, z = -1543.769},
    {name = "🩸 CINCIN BERDARAH", x = -694.521, y = 3.839, z = 1964.598},
    {name = "🚏 STASIUN", x = -1985.014, y = 8.272, z = 449.442},
    {name = "🌲 KEBUN POHON", x = -1916.150, y = 10.360, z = 9.785},
    {name = "🕶️ PASAR AKSESORIS", x = -713.189, y = 11.674, z = -1798.412},
    {name = "🧰 PASAR GELAP", x = -2230.074, y = 40.222, z = -2511.948},
    {name = "🏫 SEKOLAH MENGEMUDI", x = -2004.901, y = 8.304, z = 507.134},
    {name = "🪖 ARMY", x = -40.968, y = 12.832, z = 11.233},
    {name = "🏢 KANTOR ARMY", x = -234.058, y = 13.770, z = -18.085},
    {name = "👮🏻 KANTOR POLISI FEDERAL", x = -1943.651, y = 8.304, z = 1118.078},
    {name = "⛪ GEREJA", x = -2097.495, y = 10.431, z = 569.232}
}
local umum = {
    -- TELEPORT UMUM
    {name = "🏛️ BALAI KOTA", x = -1855.318, y = 10.691, z = 1456.796},
    {name = "🏡 RUMAH LELANG", x = -2074.614, y = 8.917, z = 1292.522},
    {name = "🛻 DEALER MOBIL EKONOMI", x = -589.651, y = 10.175, z = -1527.842},
    {name = "🚗 DEALER MOBIL MENENGAH", x = -1833.414, y = 8.287, z = 1625.111},
    {name = "🚙 DEALER MOBIL PREMIUM", x = -2228.894, y = 8.704, z = 1223.101},
    {name = "🚚 DEALER TRUK", x = -1333.213, y = 12.854, z = -290.881},
    {name = "🛵 SALON MOTOR", x = -1986.773, y = 8.318, z = 931.665},
    {name = "🔧 BENGKEL SERVIS", x = -2037.158, y = 8.346, z = 1406.589},
    {name = "🖌️ PUSAT STYLING", x = -1733.242, y = 8.288, z = 1522.716},
    {name = "🛞 PUSAT TAMBAL BAN", x = -1989.480, y = 8.318, z = 1185.091},
    {name = "🛒 PASAR MOBIL", x = -283.851, y = 11.922, z = -2220.262},
    {name = "🏨 HOTEL", x = -444.375, y = 11.799, z = -2316.710}
}

local fraksi = {
    -- FRAKSI
    {name = "🟣 GANTELMAN", x = -1344.205, y = 20.246, z = -1414.999},
    {name = "🟢 SERIGALA", x = -1082.850, y = 10.511, z = -1761.345},
    {name = "🏥 RUMAH SAKIT", x = -2130.903, y = 8.253, z = 1094.955},
    {name = "🏥 DALAM RUMAH SAKIT", x = 912.353, y = 1012.000, z = 36.865},
    {name = "🎤 MEDIA MASSA", x = -2151.320, y = 8.875, z = 854.150}
}

local toko = {
    -- TOKO
    {name = "🏪 TOKO 24/7 ST", x = -2045.240, y = 8.263, z = 571.230},
    {name = "🏪 TOKO 24/7 JEMBATAN", x = -1684.710, y = 12.057, z = -770.328},
    {name = "🏪 TOKO 24/7 RS", x = -2123.570, y = 8.236, z = 1179.322},
    {name = "⛽ POM BENSIN JEMBATAN", x = -1374.760, y = 20.400, z = -1001.371},
    {name = "⛽ POM BENSIN HOOD UNGU", x = -1444.333, y = 10.651, z = -1475.790},
    {name = "🏤 TOKO PAKAIAN", x = -2017.683, y = 8.208, z = 525.924},
    {name = "🏬 WARUNG MAKAN", x = -1982.765, y = 8.208, z = 499.802},
    {name = "🔫 TOKO SENJATA ST", x = -1966.173, y = 8.214, z = 490.732},
    {name = "🔫 TOKO SENJATA UNGU", x = -971.076, y = 11.674, z = -1516.155}
}

local parkiran = {
    -- PARKIRAN
    {name = "🅿️ PARKIRAN UNGU", x = -1365.542, y = 40.883, z = -1296.527},
    {name = "🅿️ PARKIRAN STASIUN", x = -2026.550, y = 8.272, z = 452.677}
}

local bank = {
    {name = "🏦 BANK ARCADIA", x = -1803.679, y = 8.379, z = 1200.355},
    {name = "🏦 BANK MEIR", x = -589.155, y = 11.998, z = 1754.781}
}

local scooter = {
    -- SEWA SCOOTER
    {name = "🛵 SEWA SCOOTER STASIUN", x = -2018.763, y = 8.284, z = 470.858},
    {name = "🛵 SEWA SCOOTER RS", x = -2063.716, y = 8.257, z = 1077.299}
}

local jobkerja = {
    {name = "🛖 PETERNAKAN", x = 193.703, y = 10.735, z = -2475.041},
    {name = "⛏️ TAMBANG", x = -1133.110, y = 43.746, z = -179.977},
    {name = "🍕 PIZZA", x = -2170.384, y = 8.219, z = 1000.431},
    {name = "🚌 BUS", x = -1381.211, y = 11.508, z = -305.560},
    {name = "🚛 TRUK SAMPAH", x = -2038.808, y = 15.807, z = -430.695},
    {name = "🚚 TRUK JARAK JAUH", x = -1447.565, y = 8.361, z = 1880.946}
}

local ladang = {
    {name = "🌾 LADANG GANDUM", x = 287.784, y = 15.116, z = -2457.071},
    {name = "🥑 LADANG ALPUKAT", x = 235.095, y = 15.068, z = -2408.993},
    {name = "🥔 LADANG KENTANG", x = 237.054, y = 16.507, z = -2366.803}
}

local penjara = {
    {name = "🔗 GERBANG SEL", x = -2733.432, y = 31.288, z = 7.942},
    {name = "🏀 LAPANGAN BASKET SEL", x = -2762.762, y = 31.285, z = -26.951},
    {name = "🍽️ PEMBAGIAN MAKANAN SEL", x = 1131.338, y = 2159.920, z = 1704.352},
    {name = "📞 TELEPON SEL", x = 1127.786, y = 2159.920, z = 1730.361}
}

local kontainer = {
    -- KONTAINER
    {name = "🪝 LELANG KONTAINER", x = -1340.025, y = 6.771, z = 2725.360}
}


-- ================= KING ARCHIVE TIR ================= --
local tempo = os.date("*t")
local hora = tempo.hour
local saudacao = "Selamat malam"
if hora >= 5 and hora < 12 then saudacao = "Selamat pagi"
elseif hora >= 12 and hora < 18 then saudacao = "Selamat siang" end
local dataHoraFormatada = string.format("%02d/%02d/%04d - %02d:%02d:%02d", tempo.day, tempo.month, tempo.year, tempo.hour, tempo.min, tempo.sec)

gg.alert(
    "      " .. saudacao .. ", Pemain!\n\n" ..
    "      📅 " .. dataHoraFormatada .. "\n\n" ..
    "✅ **SELAMAT! ANDA TELAH MENJADI PREMIUM USER** ✅\n\n" ..
    "🌟 **KING TIRRZ PREMIUM v3.7** 🌟\n\n" ..
    "👑 **STATUS:** VIP / PREMIUM AKTIF\n" ..
    "🔓 **Semua Fitur Telah Dibuka**\n" ..
    "⚡ **Performa Maksimal** - Stabil di semua perangkat\n\n" ..
    "🎮 **Nikmati Pengalaman Premium:**\n" ..
    "• ✅ Akses semua fitur tanpa batas\n" ..
    "• ✅ Update otomatis fitur terbaru\n" ..
    "• ✅ Dukungan prioritas\n" ..
    "• ✅ Kompatibilitas penuh semua game\n\n" ..
    "💎 **TERIMA KASIH TELAH MEMPERCAYAI KING TIRR MODZ**\n\n" ..
    "🚀 Semoga selalu menang dan enjoy game-nya!\n" ..
    "🔥 Jangan lupa share hasilnya ya!\n\n" ..
    "📱 **KING TIRR** - WhatsApp: 085138961370"
)

gg.toast("KING TIRR MODZ Loaded!")

--"🔒 **KING TIRRZ MENU - VERSI GRATIS** 🔒\n\n" ..
--    "⚠️ **PENTING:** Anda sedang menggunakan versi FREE/TRIAL\n\n" ..
 --   "📱 **KETERBATASAN VERSI GRATIS:**\n" ..
---    "• ⚠️ Kompatibilitas terbatas - Beberapa fitur mungkin tidak berfungsi\n" ..
 ---   "• 🔄 Fungsionalitas berkurang - Hanya fitur dasar yang tersedia\n" ..
  ---  "• 🐛 Kemungkinan tidak stabil - Performa bisa berbeda antar perangkat\n\n" ..
--    "✅ **VERSI VIP - BERFUNGSI 100% DI SEMUA PERANGKAT:**\n" ..
 ---   "• 📱 Kompatibilitas penuh - Diuji & dioptimalkan untuk semua model\n" ..
  --  "• ⚡ Performa terjamin - Stabilitas maksimal\n" ..
 --   "• 🔓 Akses lengkap - Semua fitur dibuka\n" ..
 ---   "• 🔄 Update rutin - Dukungan game terbaru\n\n" ..
 ---   "🔥 **UPGRADE SEKARANG & BUKA SEMUA FITUR:**\n" ..
 ---   "📱 WhatsApp: 085138961370 (KING TIRR)\n\n" ..
--    "💎 **Rasakan kekuatan ASLI King Tirr Modz!**\n" ..
  ---  "⏱ Aktivasi VIP kurang dari 5 menit!\n" ..
 --   "🎮 **Main tanpa batas, main seperti VIP!**"

function premiumAlert()
    gg.alert(
"🔒 **SCRIPT KING TIRR MODZ - VERSI GRATIS** 🔒\n\n" ..
    "⚠️ **PENTING:** Anda sedang menggunakan versi FREE/TRIAL\n\n" ..
    "📱 **KETERBATASAN VERSI GRATIS:**\n" ..
    "• ⚠️Kompatibilitas terbatas - Beberapa fitur mungkin tidak berfungsi\n" ..
    "• 🔄Fungsionalitas berkurang - Hanya fitur dasar yang tersedia\n" ..
    "• 🐛Kemungkinan tidak stabil - Performa bisa berbeda antar perangkat\n\n" ..
    "✅ **VERSI VIP - BERFUNGSI 100% DI SEMUA PERANGKAT:**\n" ..
    "• 📱Kompatibilitas penuh - Diuji & dioptimalkan untuk semua model\n" ..
    "• ⚡Performa terjamin - Stabilitas maksimal di semua perangkat\n" ..
    "• 🔓Akses lengkap - Semua fitur dibuka\n" ..
    "• 🔄Update rutin - Dukungan untuk game terbaru\n\n" ..
    "🔥 **UPGRADE SEKARANG & BUKA SEMUA FITUR:**\n" ..
    "📱 WhatsApp: 085138961370 (KING TIRR)\n\n" ..
    "💎 **Rasakan kekuatan ASLI King Tirr Modz!**\n" ..
    "⏱ Aktivasi VIP kurang dari 5 menit!\n" ..
    "🎮 **Main tanpa batas, main seperti VIP!**"
    )
end

function maintenance()
    gg.alert(
    "🔧 **MAINTENANCE** 🔧\n\n" ..
        "Fitur Ini Sedang Dalam Proses Perbaikan.\n\n" ..
        "🔄 Mohon bersabar, Tim KING TIRRZ Sedang Bekerja\n" ..
        "Untuk Meningkatkan Kualitas Fitur Ini.\n\n" ..
        "📌 Kamu Masih Bisa Menggunakan Fitur Lainnya.\n\n" ..
        "💎 **KING TIRR MODZ** - Selalu Terbaik Untuk Anda",
        "✅ OK"
    )
end

function menuVeiculos()
   local veiculosMenu = gg.choice({
       "🚗 Aim Kill (Anda membutuhkan kendaraan.) 🚗",
       "🚗 Infinite Bodywork (Harus terpasang di dalam kendaraan)) 🚗",
       "🚗 Mengalami kerusakan kendaraan (Harus berada di dalam kendaraan)) 🚗",
       "🚗💨 Kendaraan Kecepatan 🚗💨",
       "《↩️》Kembali"
   }, nil, "🚗 MENU KENDARAAN 🚗")

   if veiculosMenu == 1 then aimkillcarro() end
   if veiculosMenu == 2 then latariainf() end
   if veiculosMenu == 3 then quebrarveiculo() end
   if veiculosMenu == 4 then SpeedHackGamer() end
   if veiculosMenu == 5 then menu_principal() end
end

-- ==========================================
-- FUNÇÃO LIGA MOTO
-- ==========================================
function LigaMotoOn()
    gg.clearResults()
    gg.searchNumber("1.0", gg.TYPE_FLOAT)
    local res = gg.getResults(2000)
    for i, v in ipairs(res) do
        gg.setValues({{address = v.address + 0x10, flags = gg.TYPE_FLOAT, value = 999999}})
    end
    gg.toast("🏍️ Liga Moto DIAKTIFKAN")
end

-- ==========================================
-- FUNÇÃO AIM KILL
-- ==========================================
function AimKillMenu()
    local menu = gg.choice({"AKTIFKAN", "NONAKTIFKAN", "KEMBALI"}, nil, "🎯 AIM KILL")
    if menu == 1 then
        gg.clearResults()
        gg.searchNumber("0.05999999866", gg.TYPE_FLOAT)
        gg.getResults(500)
        gg.editAll("0", gg.TYPE_FLOAT)
        gg.toast("🎯 Aim Kill AKTIF")
    elseif menu == 2 then
        gg.clearResults()
        gg.searchNumber("0", gg.TYPE_FLOAT)
        gg.getResults(500)
        gg.editAll("0.05999999866", gg.TYPE_FLOAT)
        gg.toast("❌ Aim Kill NONAKTIF")
    end
end

function MenuPremium2()
    local statusSpeed = active and "on" or "off"
    local escolha = gg.choice({
        "🏃 AUTO RUN",
        "🎯 AIM KILL",
        "🏍️ LIGA MOTOR",
        "📷 ZOOM CAMERA ",
        "👽 BLINK TP",
        "📢 TEMBUS TEMBOK",
        "◀️ KEMBALI"
    }, nil, "💎 MENU PREMIUM")

    if escolha == 1 then autoRun()
    elseif escolha == 2 then AimKillMenu()
    elseif escolha == 3 then LigaMotoOn()
    elseif escolha == 4 then esticada()
    elseif escolha == 5 then modoToggleSpamIlimitado()
    elseif escolha == 6 then WallHackMenu()
    elseif escolha == 7 then menu_principal()
    end
end

-- ==========================================
-- SISTEMA: SAIR DA PRISÃO
-- ==========================================
function sairDaPrisaoBot()
    if not addrZ and not buscarBasePlayer() then return end

    local x1, y1, z1 = 1140.140, 2159.920, 1752.780   
    local x2, y2, z2 = -2797.580, 32.894, -16.028     
    local x3, y3, z3 = -2117.915, 9.087, 355.186      

    local RAIO_DETECCAO = 2.0 

    gg.toast("🏃 MEMULAI PELARIAN: MENUJU TITIK 1...")
    TP(x1, y1, z1)
    gg.sleep(500)

    gg.toast("🔍 MEMANTAU PENDEKATAN TITIK 2 (SISTEM SINAR)...")
    local monitorando = true

    while monitorando do
        if gg.isVisible() then
            gg.setVisible(false)
            if gg.alert("🏃 PELARIAN AKTIF", "🛑 HENTIKAN PELARIAN") == 1 then
                monitorando = false
                break
            end
        end

        local pos = gg.getValues({
            {address = addrX, flags = gg.TYPE_FLOAT}, 
            {address = addrY, flags = gg.TYPE_FLOAT}, 
            {address = addrZ, flags = gg.TYPE_FLOAT}
        })

        local dx = x2 - pos[1].value
        local dy = y2 - pos[2].value
        local dz = z2 - pos[3].value
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

        if dist <= RAIO_DETECCAO then
            gg.toast("⚡ TELEPORT KILAT! BERTELEPORTASI KE TITIK 3 (KEBEBASAN)!")
            TP(x3, y3, z3)
            monitorando = false
            break
        end

        gg.sleep(100)
    end
end

-- ==========================================
-- FUNÇÕES DO COMPLEMENTO GAME EXTRA
-- ==========================================
function Sprint()
    gg.clearResults()
    gg.searchNumber("281474993487972", gg.TYPE_QWORD)
    local r = gg.getResults(30)
    if #r == 0 then gg.alert("❌ NILAI TIDAK DITEMUKAN.") else
        local t = {}
        for i, v in ipairs(r) do t[i] = { address = v.address - 0x160, flags = gg.TYPE_FLOAT, value = 450, freeze = true } end
        gg.setValues(t)
        gg.addListItems(t)
        gg.toast("✅ AUTO RUN AKFIF")
    end
end

function SpeedHackAbaGame()
    gg.clearResults()
    if not active then
        local input = gg.prompt({"Kecepatan (Slider):"}, {selectedSpeed}, {"number"})
        if input then selectedSpeed = tonumber(input[1]) end
        gg.searchNumber("9187343240761165228", gg.TYPE_QWORD)
        local results = gg.getResults(1)
        if #results == 0 then gg.alert("❌ Nilai dasar tidak ditemukan.."); return end
        savedAddr = results[1].address
        savedValue = gg.getValues({{address = savedAddr, flags = gg.TYPE_QWORD}})[1].value
        gg.setValues({{address = savedAddr, flags = gg.TYPE_FLOAT, value = selectedSpeed}})
        active = true
    else
        if savedAddr then gg.setValues({{address = savedAddr, flags = gg.TYPE_QWORD, value = savedValue}}) end
        active = false
    end
end

-- ==========================================
-- 🆕 FUNÇÃO ACELERA GAMER (SPEED HACK MODERNO)
-- ==========================================
local activeSpeed = false
local savedAddr = nil
local savedValue = nil
local speedGamerValue = 1.0

function SpeedHackGamer(customSpeed)
    gg.clearResults()
    
    if not activeSpeed then
        -- Jika customSpeed tidak dikirim, pakai prompt
        if not customSpeed then
            local input = gg.prompt({"Masukkan Kecepatan (1-20):"}, {speedGamerValue}, {"number"})
            if not input then return end
            customSpeed = tonumber(input[1])
        end
        
        if customSpeed < 1 then customSpeed = 1 end
        if customSpeed > 20 then customSpeed = 20 end
        
        gg.searchNumber("9187343240761165228", gg.TYPE_QWORD)
        local results = gg.getResults(1)
        
        if #results == 0 then 
            gg.alert("❌ Nilai dasar tidak ditemukan!")
            return 
        end
        
        savedAddr = results[1].address
        savedValue = gg.getValues({{address = savedAddr, flags = gg.TYPE_QWORD}})[1].value
        
        gg.setValues({{address = savedAddr, flags = gg.TYPE_FLOAT, value = customSpeed}})
        
        activeSpeed = true
        speedGamerValue = customSpeed
        gg.toast("🕹️ Speed Diaktifkan → " .. customSpeed .. "x", true)
        
    else
        -- Matikan speed
        if savedAddr then 
            gg.setValues({{address = savedAddr, flags = gg.TYPE_QWORD, value = savedValue}})
        end
        activeSpeed = false
        gg.toast("🛑 Speed Kendaraan Dinonaktifkan", true)
    end
end

function Menu_vehicle()
    local status = activeSpeed and ("🟢 AKTIF (" .. speedGamerValue .. "x)") or "🔴 NORMAL"
    
    local menu = gg.choice({
        "🏎️ Speed Kendaraan ×1.6 (Aman)",
        "🏎️ Speed Kendaraan ×2.1 (Aman)",
        "🏎️ Speed Kendaraan ×2.5 (Rawan)",
        "🏎️ Speed Kendaraan ×4.0 (Rawan)",
        "🏎️ Speed Kendaraan ×5.0 (Full Speed)",
        "⚙️ Custom Speed (Input Sendiri)",
        "🛑 Matikan Speed Kendaraan",
        "🔙 Kembali ke Menu Utama"
    }, nil, "🏎️ MENU SPEED KENDARAAN\nTIRR MODZ\nStatus: " .. status)
    
    if not menu then return end
    
    if menu == 1 then
        SpeedHackGamer(1.6)
    elseif menu == 2 then
        SpeedHackGamer(2.1)
    elseif menu == 3 then
        SpeedHackGamer(2.5)
    elseif menu == 4 then
        SpeedHackGamer(4.0)
    elseif menu == 5 then
        SpeedHackGamer(5.0)
    elseif menu == 6 then
        SpeedHackGamer() -- custom
    elseif menu == 7 then
        SpeedHackGamer() -- toggle off
    elseif menu == 8 then
        menu_principal()
        return
    end
end

-- ==========================================
-- FUNÇÃO TELEPORTE GPS
-- ==========================================
function TP_GPS()
    if not addrX and not buscarBasePlayer() then 
        gg.toast("❌ Base player tidak ditemukan!")
        return 
    end
    
    gg.clearResults()
    gg.setRanges(gg.REGION_C_BSS)
    gg.searchNumber("7233187898168705024", gg.TYPE_QWORD)
    local r = gg.getResults(100)

    if #r == 0 then
        gg.toast("❌ Tandai tujuan di peta terlebih dahulu!")
        return
    end

    local gps_address = nil
    for i, v in ipairs(r) do
        local test = gg.getValues({{address = v.address - 0x14, flags = gg.TYPE_FLOAT}})[1].value
        if test == 0 then
            -- nilai 0, skip
        else
            gps_address = v.address
            break 
        end
    end

    if not gps_address then 
        gg.toast("❌ GPS tidak ditemukan atau tidak valid") 
        return
    end

    local gpsAtivo = true
    gg.toast("⚡ Teleportasi GPS Instan")

    while gpsAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            if gg.alert("📍 TP GPS AKTIF", "🛑 STOP") == 1 then 
                gpsAtivo = false
                break 
            end
        end

        local atual = gg.getValues({
            {address = gps_address - 0x14, flags = gg.TYPE_FLOAT}, 
            {address = gps_address - 0x10, flags = gg.TYPE_FLOAT}, 
            {address = gps_address - 0x0C, flags = gg.TYPE_FLOAT}  
        })

        -- Pengecekan tanpa \~=
        if atual[1].value == 0 or atual[2].value == 0 then
            -- skip jika ada yang 0
        else
            gg.setValues({
                {address = addrX, value = atual[2].value, flags = gg.TYPE_FLOAT},
                {address = addrY, value = atual[3].value, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = atual[1].value, flags = gg.TYPE_FLOAT}
            })
        end
        gg.sleep(300)
    end
end

function GPS_AUTOMATICO_VEICULO()
    if not addrZ and not buscarBasePlayer() then return end
    
    gg.clearResults()
    gg.setRanges(gg.REGION_C_BSS)
    gg.searchNumber(gps_qword, gg.TYPE_QWORD)
    local r = gg.getResults(50)
    if #r == 0 then
        gg.alert("❌ TANDAI TUJUAN DI PETA TERLEBIH DAHULU!")
        return
    end
    
    local gps_address = nil
    for i, v in ipairs(r) do
        local test = gg.getValues({{address = v.address - gps_offZ, flags = gg.TYPE_FLOAT}})[1].value
        if test ~= 0 then
            gps_address = v.address
            break
        end
    end
    
    if not gps_address then
        gg.alert("❌ GPS TIDAK DITEMUKAN")
        return
    end
    
    gg.clearResults()
    gg.setRanges(gg.REGION_C_BSS)
    gg.searchNumber(gps_qword, gg.TYPE_QWORD)
    local resVeiculo = gg.getResults(100)
    if #resVeiculo == 0 then
        gg.alert("❌ KENDARAAN TIDAK DITEMUKAN! SILAKAN NAIK KE KENDARAAN TERLEBIH DAHULU..")
        return
    end
    
    local veiculoAddress = nil
    local playerPos = gg.getValues({
        {address = addrX, flags = gg.TYPE_FLOAT},
        {address = addrY, flags = gg.TYPE_FLOAT},
        {address = addrZ, flags = gg.TYPE_FLOAT}
    })
    
    for i, v in ipairs(resVeiculo) do
        local testPos = gg.getValues({
            {address = v.address + 0x20, flags = gg.TYPE_FLOAT},
            {address = v.address + 0x24, flags = gg.TYPE_FLOAT},
            {address = v.address + 0x28, flags = gg.TYPE_FLOAT}
        })
        
        if testPos[1].value ~= 0 or testPos[2].value ~= 0 or testPos[3].value ~= 0 then
            local dx = testPos[1].value - playerPos[1].value
            local dy = testPos[2].value - playerPos[2].value
            local dz = testPos[3].value - playerPos[3].value
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            
            if dist < 50 then
                veiculoAddress = v.address
                break
            end
        end
    end
    
    if not veiculoAddress then
        gg.alert("❌ KENDARAAN TIDAK DITEMUKAN! SILAKAN MASUKKAN KENDARAAN TERLEBIH DAHULU..")
        return
    end
    
    local veiculoX = veiculoAddress + 0x20
    local veiculoY = veiculoAddress + 0x24
    local veiculoZ = veiculoAddress + 0x28
    
    gpsAtivo = true
    gg.toast("🚗 MENUJU LOKASI PEMERIKSAAN DENGAN KENDARAAN...")
    
    while gpsAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            local p = gg.alert("🚗 GPS KENDARAAN AKTIF", "🛑 BERHENTI", "▶️ LANJUTKAN")
            if p == 1 then gpsAtivo = false break end
        end
        
        antiKick()
        
        local atual = gg.getValues({
            {address = gps_address - gps_offZ, flags = gg.TYPE_FLOAT},
            {address = gps_address - gps_offX, flags = gg.TYPE_FLOAT},
            {address = gps_address - gps_offY, flags = gg.TYPE_FLOAT}
        })
        
        if atual[1].value ~= 0 then
            gg.setValues({
                {address = veiculoX, value = atual[2].value, flags = gg.TYPE_FLOAT},
                {address = veiculoY, value = atual[3].value, flags = gg.TYPE_FLOAT},
                {address = veiculoZ, value = atual[1].value, flags = gg.TYPE_FLOAT}
            })
            
            gg.setValues({
                {address = addrX, value = atual[2].value, flags = gg.TYPE_FLOAT},
                {address = addrY, value = atual[3].value, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = atual[1].value + 1.5, flags = gg.TYPE_FLOAT}
            })
        end
        
        gg.sleep(300)
    end
end

local ultimoMovimento = 0

function antiKick()
    local tempoAtual = os.time()
    
    if tempoAtual - ultimoMovimento >= 3 then
        ultimoMovimento = tempoAtual
        
        if addrX and addrY and addrZ then
            local pos = gg.getValues({
                {address = addrX, flags = gg.TYPE_FLOAT},
                {address = addrZ, flags = gg.TYPE_FLOAT}
            })
            
            if pos[1] and pos[2] then
                local deslocamento = 0.001
                local direcao = math.random(1, 4)
                
                if direcao == 1 then
                    gg.setValues({{address = addrX, value = pos[1].value + deslocamento, flags = gg.TYPE_FLOAT}})
                elseif direcao == 2 then
                    gg.setValues({{address = addrX, value = pos[1].value - deslocamento, flags = gg.TYPE_FLOAT}})
                elseif direcao == 3 then
                    gg.setValues({{address = addrZ, value = pos[2].value + deslocamento, flags = gg.TYPE_FLOAT}})
                else
                    gg.setValues({{address = addrZ, value = pos[2].value - deslocamento, flags = gg.TYPE_FLOAT}})
                end
            end
        end
    end
end


-- ==========================================
-- FUNÇÕES FARM FAZENDA E MINA
-- ==========================================
function farmFazendaBot()
    if not addrZ and not buscarBasePlayer() then return end
    
    local checkpointsSalvos = {}
    local maxCheckpoints = 7
    
    -- FASE 1: Gravação das Coordenadas
    gg.alert("🎯 MODE PEREKAMAN\n\nBERJALANLAH KE SETIAP TITIK DAN KLIK IKONNYA. GG UNTUK MENYIMPAN POSISI 1 SAMPAI 7.\nPADA PERCOBAAN KE-8, BOT AKAN MULAI BERJALAN.", "DIPAHAMI‼️")
    
    while #checkpointsSalvos < maxCheckpoints do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local pos = gg.getValues({
                {address = addrX, flags = gg.TYPE_FLOAT}, 
                {address = addrY, flags = gg.TYPE_FLOAT}, 
                {address = addrZ, flags = gg.TYPE_FLOAT}
            })
            
            local numCP = #checkpointsSalvos + 1
            table.insert(checkpointsSalvos, {x = pos[1].value, y = pos[2].value, z = pos[3].value})
            
            gg.toast("📍 POSISI " .. numCP .. " BERHASIL DISIMPAN!")
        end
        gg.sleep(100)
    end
    
    -- Aguarda o 8º clique para iniciar
    gg.toast("✅ 7 POIN TERSIMPAN! KLIK GG LAGI UNTUK MEMULAI PERTANIAN..")
    while true do
        if gg.isVisible() then
            gg.setVisible(false)
            break
        end
        gg.sleep(100)
    end

    -- FASE 2: Execução do Farm
    local farmFazendaAtivo = true
    local cp = 1
    gg.toast("🌾 PERTANIAN DIMULAI DENGAN RUTE ANDA!")

    while farmFazendaAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            local escolha = gg.alert("🌾 OTOMATIS", "🛑 STOP", "⏭ SKIP")
            if escolha == 1 then 
                farmFazendaAtivo = false
                break 
            elseif escolha == 2 then
                cp = cp + 1
                if cp > maxCheckpoints then cp = 1 end
            end
        end

        local alvo = checkpointsSalvos[cp]
        local pos = gg.getValues({
            {address = addrX, flags = gg.TYPE_FLOAT}, 
            {address = addrY, flags = gg.TYPE_FLOAT}, 
            {address = addrZ, flags = gg.TYPE_FLOAT}
        })
        
        local dx, dy, dz = alvo.x - pos[1].value, alvo.y - pos[2].value, alvo.z - pos[3].value
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

        if dist < DIST_MIN then
            local tempoEspera = (cp == maxCheckpoints) and TEMPO_ESPERA_FINAL or TEMPO_ESPERA_PADRAO
            gg.toast("🌱 Tiba di Posisi " .. cp .. "! Menunggu " .. tempoEspera .. "s...")
            
            gg.sleep(tempoEspera * 1000)
            
            cp = cp + 1
            if cp > maxCheckpoints then cp = 1 end
        else
            local nx = pos[1].value + (dx / dist) * SPEED_FAZENDA
            local ny = pos[2].value + (dy / dist) * SPEED_FAZENDA
            local nz = pos[3].value + (dz / dist) * SPEED_FAZENDA
            
            gg.setValues({
                {address = addrX, value = nx, flags = gg.TYPE_FLOAT}, 
                {address = addrY, value = ny, flags = flags, flags = gg.TYPE_FLOAT}, 
                {address = addrZ, value = nz, flags = gg.TYPE_FLOAT}
            })
        end
        gg.sleep(50)
    end
end

-- ==========================================
-- COORDENADAS DA MINA ANTIGA
-- ==========================================

-- PONTO 1: Em Cima da Terra (Y ajustado para superfície)
-- PONTO 2, 3 e 4: Dentro da mina (coordenadas originais)
local checkpointsMinaAntiga = {
    {x = 19.4, y = 1050.0, z = 859.3, nome = "🌍 TITIK 1 (DI ATAS TANAH)"},     -- Y alterado para ficar na superfície
    {x = 21.1, y = 1012.1, z = 833.7, nome = "⛏️ TITIK 2 (DI TAMBANG)"},        -- Original
    {x = 23.2, y = 1009.6, z = 807.9, nome = "⛏️ TITIK 3 (DI TAMBANG)"},        -- Original
    {x = 19.4, y = 1012.2, z = 859.3, nome = "⛏️ TITIK 4 (DI TAMBANG)"}         -- NOVO PONTO 4
}

-- PONTO SEGURO (caso caia no void)
local pontoSeguro = {x = 19.4, y = 1050.0, z = 859.3, nome = "🏔️ TITIK AMAN"}

-- ==========================================
-- CHECKPOINTS PARA O TASKBOT ORIGINAL
-- ==========================================

local checkpoints = {
    {x = 19.4, y = 1012.2, z = 859.3},
    {x = 21.1, y = 1012.1, z = 833.7},
    {x = 23.2, y = 1009.6, z = 807.9},
    {x = 19.4, y = 1012.2, z = 859.3}    -- NOVO CHECKPOINT 4
}
local checkpoint_names = {
    "🗿 TITIK 1 (Tambang)", 
    "🗿 TITIK 2 (Tambang)", 
    "🗿 TITIK 3 (Tambang)",
    "🗿 TITIK 4 (Tambang)"     -- NOVO NOME
}

-- CHECKPOINTS TP CORRIGIDO
local pontosSeguros = {
    {x = 19.4, y = 1012.2, z = 859.3, nome = "🎯 TITIK 1"},
    {x = 21.1, y = 1012.1, z = 833.7, nome = "🎯 TITIK 2"},
    {x = 23.2, y = 1009.6, z = 807.9, nome = "🎯 TITIK 3"},
    {x = 19.4, y = 1012.2, z = 859.3, nome = "🎯 TITIK 4"}    -- NOVO PONTO 4
}

-- ==========================================
-- FUNÇÃO ANTI-VOID
-- ==========================================

function antiVoid()
    if not addrY then
        return false
    end
    
    local altura = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
    
    if altura and altura[1] and altura[1].value then
        if altura[1].value < 900 or altura[1].value > 2000 then
            gg.toast("💀 DETEKSI KEKOSONGAN! Berteleportasi Ke Tempat Yang Aman...")
            gg.setValues({
                {address = addrX, value = pontoSeguro.x, flags = gg.TYPE_FLOAT},
                {address = addrY, value = pontoSeguro.y, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = pontoSeguro.z, flags = gg.TYPE_FLOAT}
            })
            gg.sleep(100)
            return true
        end
    end
    return false
end

-- ==========================================
-- FUNÇÃO DE TELEPORTE PARA PONTO SEGURO (TERRA)
-- ==========================================

function teleportToSafePoint()
    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ Teleportasi tidak mungkin dilakukan.")
        return false
    end
    
    gg.setValues({
        {address = addrX, value = pontoSeguro.x, flags = gg.TYPE_FLOAT},
        {address = addrY, value = pontoSeguro.y, flags = gg.TYPE_FLOAT},
        {address = addrZ, value = pontoSeguro.z, flags = gg.TYPE_FLOAT}
    })
    
    gg.toast("🏔️ TELEPORT PARA " .. pontoSeguro.nome)
    return true
end

-- ==========================================
-- FARM MINA ANTIGA (PRIMEIRO PONTO EM CIMA DA TERRA) COM 4 PONTOS
-- ==========================================

function farmMinaAntigaComTerra()
    if #checkpointsMinaAntiga < 2 then
        gg.alert("❌ Poin Tambang Belum Dikonfigurasi!")
        return
    end
    
    if not addrZ and not buscarBasePlayer() then 
        gg.alert("❌ Pemain Tidak Ditemukan")
        return 
    end
    
    local farming = true
    local loopCount = 0
    local currentPoint = 1
    local delayColeta = 15000  -- 15 Detik Per Poin
    
    gg.toast("🌍 FARM MINA ANTIGA | 4 PONTOS | PONTO 1 NA TERRA | 15s por ponto")
    
    while farming do
        local ponto = checkpointsMinaAntiga[currentPoint]
        
        -- TELEPORTA PRO PONTO ATUAL
        gg.setValues({
            {address = addrX, value = ponto.x, flags = gg.TYPE_FLOAT},
            {address = addrY, value = ponto.y, flags = gg.TYPE_FLOAT},
            {address = addrZ, value = ponto.z, flags = gg.TYPE_FLOAT}
        })
        
        gg.toast("📍 " .. ponto.nome)
        gg.sleep(100)
        
        -- VERIFICA SE NÃO CAIU NO VOID
        local verifica = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
        local tentativas = 0
        
        -- Se for ponto 1 (terra), verifica altura ~1050
        if currentPoint == 1 then
            while (verifica[1].value < 1040 or verifica[1].value > 1060) and tentativas < 3 do
                gg.toast("⚠️ Ajustando altura para o terreno...")
                gg.setValues({
                    {address = addrX, value = ponto.x, flags = gg.TYPE_FLOAT},
                    {address = addrY, value = ponto.y, flags = gg.TYPE_FLOAT},
                    {address = addrZ, value = ponto.z, flags = gg.TYPE_FLOAT}
                })
                gg.sleep(50)
                verifica = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
                tentativas = tentativas + 1
            end
        else
            -- Pontos da mina (dentro)
            while (verifica[1].value < 900 or verifica[1].value > 1100) and tentativas < 3 do
                gg.toast("⚠️ Kekosongan Terdeteksi! Berteleportasi lagi...")
                gg.setValues({
                    {address = addrX, value = ponto.x, flags = gg.TYPE_FLOAT},
                    {address = addrY, value = ponto.y, flags = gg.TYPE_FLOAT},
                    {address = addrZ, value = ponto.z, flags = gg.TYPE_FLOAT}
                })
                gg.sleep(50)
                verifica = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
                tentativas = tentativas + 1
            end
        end
        
        -- CONTAGEM REGRESSIVA DA COLETA
        local tempoPassado = 0
        
        while tempoPassado < delayColeta and farming do
            local segundosRestantes = 15 - math.floor(tempoPassado / 1000)
            if segundosRestantes > 0 then
                local icone = (currentPoint == 1) and "🌍" or "⛏️"
                gg.toast(icone .. " MENGUMPULKAN... " .. segundosRestantes .. "s | " .. ponto.nome)
            end
            
            -- ANTI-VOID A CADA 500ms
            if math.floor(tempoPassado / 500) ~= math.floor((tempoPassado - 100) / 500) then
                antiVoid()
            end
            
            if gg.isVisible() then
                gg.setVisible(false)
                local op = gg.alert("📍 " .. ponto.nome, "🛑 BERHENTI", "⏩ LEWATI ")
                if op == 1 then
                    farming = false
                    gg.toast("⛔ BERHENTI")
                    return
                elseif op == 2 then
                    break
                end
            end
            gg.sleep(100)
            tempoPassado = tempoPassado + 100
        end
        
        -- PRÓXIMO PONTO
        currentPoint = currentPoint + 1
        if currentPoint > #checkpointsMinaAntiga then
            currentPoint = 1
            loopCount = loopCount + 1
            gg.toast("🔄 WAKTU " .. loopCount .. " COMPLETADA!")
            
            -- Mostra estatísticas do loop
            gg.toast("📊 WAKTU " .. loopCount .. " | Próximo: " .. checkpointsMinaAntiga[1].nome)
        end
    end
end

-- ==========================================
-- FARM TASKBOT (ANDANDO) - MINA ANTIGA COM 4 PONTOS
-- ==========================================

function farmTaskBot()
    if #checkpoints < 2 then
        gg.alert("❌ Anda Membutuhkan Setidaknya 2 Pos Pemeriksaan!")
        return
    end
    
    if not addrZ and not buscarBasePlayer() then 
        gg.alert("❌ Pemain Tidak Ditemukan")
        return 
    end
    
    local waitTime = 150
    local speed = 5.0
    local distanciaColeta = 4.0
    local delayColeta = 17000
    
    gpsAtivo = true
    local currentCP = 1
    local loopCount = 0
    local coletando = false
    
    gg.toast("🤖 BOT DIMULAI | " .. #checkpoints .. " pontos | ⏱️ 17 DETIK PER LOKASI")
    
    while gpsAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            local opcao = gg.alert("🤖 BOT AKTIF", "🛑 BERHENTI", "🔄 LEWATI ")
            if opcao == 1 then 
                gpsAtivo = true 
                gg.toast("⛔ BERHENTI")
                break 
            elseif opcao == 2 then
                currentCP = currentCP + 1
                if currentCP > #checkpoints then 
                    currentCP = 1
                    loopCount = loopCount + 1
                    gg.toast("🔄 Loop #" .. loopCount)
                else
                    gg.toast("⏩ Melompat Ke " .. checkpoint_names[currentCP])
                end
                coletando = false
            end
        end
        
        local target = checkpoints[currentCP]
        
        local atual = gg.getValues({
            {address = addrX, flags = gg.TYPE_FLOAT},
            {address = addrY, flags = gg.TYPE_FLOAT},
            {address = addrZ, flags = gg.TYPE_FLOAT}
        })
        
        local dx = target.x - atual[1].value
        local dy = target.y - atual[2].value
        local dz = target.z - atual[3].value
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        
        if dist < distanciaColeta and not coletando then
            coletando = true
            
            local tempoPassado = 0
            local tempoLoop = 0
            
            gg.toast("⛏️ PERTAMBANGAN DI " .. checkpoint_names[currentCP] .. " | ⏱️ 17s")
            
            while tempoPassado < delayColeta and gpsAtivo do
                if math.floor(tempoPassado / 1000) ~= 17 - math.floor(tempoPassado / 1000) then
                    local segundos = 17 - math.floor(tempoPassado / 1000)
                    if segundos > 0 then
                        gg.toast("⛏️ COLETANDO... " .. segundos .. "s | " .. checkpoint_names[currentCP])
                    end
                end
                
                tempoLoop = tempoLoop + 100
                if tempoLoop >= 500 then
                    antiVoid()
                    tempoLoop = 0
                end
                
                if gg.isVisible() then
                    gg.setVisible(false)
                    local pular = gg.alert("⛏️ MENGUMPULKAN... " .. (17 - math.floor(tempoPassado/1000)) .. "s", "⏩ LEWATI", "🛑 BERHENTI")
                    if pular == 1 then
                        break
                    elseif pular == 2 then
                        gpsAtivo = false
                        gg.toast("⛔ Berhenti")
                        return
                    end
                end
                gg.sleep(100)
                tempoPassado = tempoPassado + 100
            end
            
            if gpsAtivo then
                gg.toast("✅ BIJIH YANG DIKUMPULKAN! → Próximo checkpoint")
                currentCP = currentCP + 1
                if currentCP > #checkpoints then
                    currentCP = 1
                    loopCount = loopCount + 1
                    gg.toast("🔄 COMPLETOU " .. loopCount .. " VOLTA(S)!")
                end
                coletando = false
            end
            
        elseif dist >= distanciaColeta and not coletando then
            local stepX = atual[1].value + (dx / dist) * speed
            local stepY = atual[2].value + (dy / dist) * speed
            local stepZ = atual[3].value + (dz / dist) * speed
            
            gg.setValues({
                {address = addrX, value = stepX, flags = gg.TYPE_FLOAT},
                {address = addrY, value = stepY, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = stepZ, flags = gg.TYPE_FLOAT}
            })
        end
        
        gg.sleep(waitTime)
    end
end

-- ==========================================
-- FARM MINA TP CORRIGIDO COM 4 PONTOS
-- ==========================================

function farmMinaTPCorrigido()
    if not addrZ and not buscarBasePlayer() then 
        gg.alert("❌ Pemain tidak ditemukan")
        return 
    end
    
    local farming = true
    local loopCount = 0
    local delayColetaTP = 17000  -- 17 detik per titik (sesuai lama panen)
    
    gg.toast("🚀 AUTO FARM TAMBANG TP DIMULAI\n🔄 LOOP INFINITE - Buka GG untuk stop")
    
    while farming do
        for i, ponto in ipairs(pontosSeguros) do
            if not farming then break end
            
            -- Teleport ke titik
            gg.setValues({
                {address = addrX, value = ponto.x, flags = gg.TYPE_FLOAT},
                {address = addrY, value = ponto.y, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = ponto.z, flags = gg.TYPE_FLOAT}
            })
            
            gg.toast("📍 TELEPORT: " .. ponto.nome)
            gg.sleep(300)
            
            -- Anti Void Check
            local verifica = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
            local tentativas = 0
            while (verifica[1].value < 900 or verifica[1].value > 2000) and tentativas < 5 do
                gg.toast("⚠️ VOID TERDETEKSI! Koreksi...")
                gg.setValues({
                    {address = addrX, value = ponto.x, flags = gg.TYPE_FLOAT},
                    {address = addrY, value = ponto.y + 5, flags = gg.TYPE_FLOAT},
                    {address = addrZ, value = ponto.z, flags = gg.TYPE_FLOAT}
                })
                gg.sleep(150)
                verifica = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
                tentativas = tentativas + 1
            end
            
            -- Waktu panen otomatis (tanpa alert)
            local tempoPassado = 0
            while tempoPassado < delayColetaTP and farming do
                local detik = 17 - math.floor(tempoPassado / 1000)
                if detik > 0 and detik % 5 == 0 then
                    gg.toast("⛏️ MENGUMPULKAN... " .. detik .. "s | " .. ponto.nome)
                end
                
                -- Anti-void setiap 1 detik
                if tempoPassado % 1000 < 100 then
                    antiVoid()
                end
                
                -- Cek apakah GG dibuka (untuk stop)
                if gg.isVisible(true) then
                    gg.setVisible(false)
                    local stop = gg.alert("🤖 AUTO FARM TAMBANG AKTIF", "🛑 BERHENTI", "LANJUTKAN")
                    if stop == 1 then
                        farming = false
                        gg.toast("⛔ AUTO FARM TAMBANG DIHENTIKAN")
                        return
                    end
                end
                
                gg.sleep(100)
                tempoPassado = tempoPassado + 100
            end
            
            gg.toast("✅ SELESAI | " .. ponto.nome)
        end
        
        loopCount = loopCount + 1
        gg.toast("🔄 LOOP KE-" .. loopCount .. " SELESAI! Melanjutkan...")
    end
end

-- ==========================================
-- FARM FAZENDA BLABEIDI
-- ==========================================
function gravarRotaFazendaBlabeidi()
    if not addrZ and not buscarBasePlayer() then 
        gg.toast("❌ Player não encontrado!")
        return nil
    end
    
    gg.alert(
        "🌾 REKAM JALUR - PERTANIAN\n\n" ..
        "1️⃣ Pergilah ke titik yang diinginkan di lahan pertanian tersebut.\n" ..
        "2️⃣ Klik ikon GG untuk menyimpan.\n" ..
        "3️⃣ Ulangi untuk semua titik.\n" ..
        "4️⃣ Klik 'SELESAI' setelah Anda selesai.\n\n" ..
        "📌 Minimal: Diperlukan 2 poin.\n" ..
        "🛡️ ANTI-KICK AKTIF!",
        "DIPAHAMI"
    )
    
    local rotaGravada = {}
    local gravando = true
    
    while gravando do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local pos = gg.getValues({
                {address = addrX, flags = gg.TYPE_FLOAT},
                {address = addrY, flags = gg.TYPE_FLOAT},
                {address = addrZ, flags = gg.TYPE_FLOAT}
            })
            
            local opcao = gg.alert(
                "📍 Ponto " .. (#rotaGravada + 1) .. "\n" ..
                "X: " .. string.format("%.2f", pos[1].value) .. "\n" ..
                "Y: " .. string.format("%.2f", pos[2].value) .. "\n" ..
                "Z: " .. string.format("%.2f", pos[3].value) .. "\n\n" ..
                "📊 Poin tersimpan: " .. #rotaGravada,
                "💾 MENYIMPAN",
                "🗑️ MENGHAPUS",
                "✅ SELESAI"
            )
            
            if opcao == 1 then
                table.insert(rotaGravada, {
                    x = pos[1].value,
                    y = pos[2].value,
                    z = pos[3].value,
                    nome = "🌾 BIDANG " .. (#rotaGravada + 1)
                })
                gg.toast("✅ Titik " .. #rotaGravada .. " salvo!")
                
            elseif opcao == 2 then
                if #rotaGravada > 0 then
                    table.remove(rotaGravada)
                    gg.toast("🗑️ POIN TERAKHIR DIHAPUS!")
                end
                
            elseif opcao == 3 then
                if #rotaGravada < 2 then
                    gg.alert("❌ MINIMAL 2 POIN DIPERLUKAN!")
                    return nil
                end
                gravando = false
                gg.toast("✅ RUTE DIREKAM DENGAN " .. #rotaGravada .. " LOKASI!")
            end
        end
        antiKick()
        gg.sleep(100)
    end
    
    return rotaGravada
end

function executarFarmFazendaBlabeidi(rota, velocidade, tempoEspera, distMinima)
    if not rota or #rota < 2 then
        gg.toast("❌ RUTE TIDAK DITEMUKAN!")
        return false
    end
    
    if farmFazendaBlabeidiAtivo then
        gg.toast("⏳ PETERNAKAN TERSEBUT SUDAH BEROPERASI.!")
        return false
    end
    
    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ PEMAIN TIDAK DITEMUKAN!")
        return false
    end
    
    farmFazendaBlabeidiAtivo = true
    checkpointAtualFazenda = 1
    ciclosFazenda = 0
    coletasFazenda = 0
    local tempoInicio = os.time()
    
    gg.toast("🌾 PERTANIAN DIMULAI DENGAN ANTI-KICK!")
    
    while farmFazendaBlabeidiAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local tempoDecorrido = os.time() - tempoInicio
            local minutos = math.floor(tempoDecorrido / 60)
            local segundos = tempoDecorrido % 60
            
            local escolha = gg.alert(
                "🌾 AUTO PERTANIAN\n" ..
                "─────────────────\n" ..
                "📍 LOKASI: " .. checkpointAtualFazenda .. "/" .. #rota .. "\n" ..
                "🔄 SIKLUS: " .. ciclosFazenda .. "\n" ..
                "📦 KOLEKSI: " .. coletasFazenda .. "\n" ..
                "⏱️ WAKTU: " .. string.format("%02d:%02d", minutos, segundos) .. "\n" ..
                "─────────────────",
                "🛑 BERHENTI",
                "⏭️ SKIP",
                "📊 STATISTIK"
            )
            
            if escolha == 1 then
                farmFazendaBlabeidiAtivo = false
                gg.toast("⏹️ BERHENTI BERTANI!")
                break
            elseif escolha == 2 then
                checkpointAtualFazenda = checkpointAtualFazenda + 1
                if checkpointAtualFazenda > #rota then checkpointAtualFazenda = 1 end
                gg.toast("⏭️ Pulando para ponto " .. checkpointAtualFazenda)
            elseif escolha == 3 then
                gg.alert(
                    "📊 STATISTIK\n\n" ..
                    "📍 LOKASI: " .. #rota .. "\n" ..
                    "🔄 SIKLUS: " .. ciclosFazenda .. "\n" ..
                    "📦 KOLEKSI: " .. coletasFazenda .. "\n" ..
                    "⏱️ WAKTU: " .. string.format("%02d:%02d", minutos, segundos) .. "\n" ..
                    "⚡ KECEPATAN: " .. velocidade .. "x\n" ..
                    "⏳ TUNGGU: " .. tempoEspera .. "s",
                    "OK"
                )
            end
        end
        
        antiKick()
        
        local alvo = rota[checkpointAtualFazenda]
        local pos = gg.getValues({
            {address = addrX, flags = gg.TYPE_FLOAT},
            {address = addrY, flags = gg.TYPE_FLOAT},
            {address = addrZ, flags = gg.TYPE_FLOAT}
        })
        
        local dx = alvo.x - pos[1].value
        local dy = alvo.y - pos[2].value
        local dz = alvo.z - pos[3].value
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        
        if dist < distMinima then
            coletasFazenda = coletasFazenda + 1
            gg.toast("🌾 MENGUMPULKAN DI: " .. alvo.nome)
            
            for i = 1, tempoEspera do
                if not farmFazendaBlabeidiAtivo then break end
                antiKick()
                gg.sleep(1000)
            end
            
            checkpointAtualFazenda = checkpointAtualFazenda + 1
            if checkpointAtualFazenda > #rota then
                checkpointAtualFazenda = 1
                ciclosFazenda = ciclosFazenda + 1
                gg.toast("🔄 SIKLUS " .. ciclosFazenda .. " completo!")
            end
        else
            local passo = velocidade / 10
            local nx = pos[1].value + (dx / dist) * passo
            local ny = pos[2].value + (dy / dist) * passo
            local nz = pos[3].value + (dz / dist) * passo
            
            gg.setValues({
                {address = addrX, value = nx, flags = gg.TYPE_FLOAT},
                {address = addrY, value = ny, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = nz, flags = gg.TYPE_FLOAT}
            })
        end
        
        gg.sleep(50)
    end
    
    return true
end

function menuFarmFazendaBlabeidi()
    local opcao = gg.choice({
        "🆕 REKAM RUTE BARU",
        "📋 MUAT RUTE DEFAULT",
        "▶️ MEMULAI PERTANIAN",
        "⏹️ BERHENTI",
        "📊 LIHAT RUTE SAAT INI",
        "↩️ KEMBALI"
    }, nil, "🌾 AUTO FARM PETERNAKAN")
    
    if opcao == 1 then
        local novaRota = gravarRotaFazendaBlabeidi()
        if novaRota then
            rotaFazendaBlabeidi = novaRota
            gg.toast("✅ RUTE TERSIMPAN DENGAN " .. #rotaFazendaBlabeidi .. " LOKASI!")
        end
        
    elseif opcao == 2 then
        rotaFazendaBlabeidi = {}
        for i, ponto in ipairs(rotaPadraoFazendaBlabeidi) do
            table.insert(rotaFazendaBlabeidi, {x = ponto.x, y = ponto.y, z = ponto.z, nome = ponto.nome})
        end
        gg.toast("✅ RUTE STANDAR YANG SARAT DENGAN " .. #rotaFazendaBlabeidi .. " LOKASI!")
        
    elseif opcao == 3 then
        if #rotaFazendaBlabeidi < 2 then
            gg.alert("❌ TIDAK ADA RUTE YANG DIKONFIGURASI.!")
            return
        end
        
        local config = gg.prompt({
            "⚡ KECEPATAN:",
            "⏱️ WAKTU TUNGGU (DETIK)):",
            "📏 JARAK MINIMUM:"
        }, {
            tostring(SPEED_FAZENDA),
            tostring(TEMPO_ESPERA_PADRAO),
            tostring(DIST_MIN)
        }, {"number", "number", "number"})
        
        if config then
            local velocidade = tonumber(config[1]) or SPEED_FAZENDA
            local tempoEspera = tonumber(config[2]) or TEMPO_ESPERA_PADRAO
            local distMinima = tonumber(config[3]) or DIST_MIN
            
            executarFarmFazendaBlabeidi(rotaFazendaBlabeidi, velocidade, tempoEspera, distMinima)
        end
        
    elseif opcao == 4 then
        if farmFazendaBlabeidiAtivo then
            farmFazendaBlabeidiAtivo = false
            gg.toast("⏹️ PETERNAKAN BERHENTI BEROPERASI!")
        else
            gg.toast("📴 TIDAK ADA PERTANIAN YANG BEROPERASI.")
        end
        
    elseif opcao == 5 then
        if #rotaFazendaBlabeidi == 0 then
            gg.alert("❌ TIDAK ADA RUTE YANG DIKONFIGURASI.!")
            return
        end
        
        local texto = "📋 RUTE SAAT INI - PERTANIAN\n\n"
        for i, ponto in ipairs(rotaFazendaBlabeidi) do
            texto = texto .. string.format(
                "📍 %s: X:%.2f Y:%.2f Z:%.2f\n",
                ponto.nome, ponto.x, ponto.y, ponto.z
            )
        end
        gg.alert(texto, "OK")
    end
end

-- ==========================================
-- FARM MINA BLABEIDI
-- ==========================================
function gravarRotaMinaBlabeidi()
    if not addrZ and not buscarBasePlayer() then 
        gg.toast("❌ Player não encontrado!")
        return nil
    end
    
    gg.alert(
        "⛏️REKAM JALUR - TAMBANG\n\n" ..
        "1️⃣ Pergilah ke titik yang diinginkan di dalam tambang.\n" ..
        "2️⃣ Klik ikon GG untuk menyimpan.\n" ..
        "3️⃣ Ulangi untuk semua titik.\n" ..
        "4️⃣ Klik 'SELESAI' setelah selesai.\n\n" ..
        "📌 Minimal: Diperlukan 2 poin.\n" ..
        "🛡️ ANTI-KICK AKTIF!",
        "ENTENDIDO"
    )
    
    local rotaGravada = {}
    local gravando = true
    
    while gravando do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local pos = gg.getValues({
                {address = addrX, flags = gg.TYPE_FLOAT},
                {address = addrY, flags = gg.TYPE_FLOAT},
                {address = addrZ, flags = gg.TYPE_FLOAT}
            })
            
            local opcao = gg.alert(
                "📍 LOKASI " .. (#rotaGravada + 1) .. "\n" ..
                "X: " .. string.format("%.2f", pos[1].value) .. "\n" ..
                "Y: " .. string.format("%.2f", pos[2].value) .. "\n" ..
                "Z: " .. string.format("%.2f", pos[3].value) .. "\n\n" ..
                "📊 LOKASI: " .. #rotaGravada,
                "💾 MENYIMPAN",
                "🗑️ MENGHAPUS",
                "✅ MENYELESAIKAN"
            )
            
            if opcao == 1 then
                table.insert(rotaGravada, {
                    x = pos[1].value,
                    y = pos[2].value,
                    z = pos[3].value,
                    nome = "⛏️ PONTO " .. (#rotaGravada + 1)
                })
                gg.toast("✅ LOKASI " .. #rotaGravada .. " TERSIMPAN!")
                
            elseif opcao == 2 then
                if #rotaGravada > 0 then
                    table.remove(rotaGravada)
                    gg.toast("🗑️ LOKASI DIHAPUS !")
                end
                
            elseif opcao == 3 then
                if #rotaGravada < 2 then
                    gg.alert("❌ MINIMAL 2 POIN DIPERLUKAN.!")
                    return nil
                end
                gravando = false
                gg.toast("✅ RUTE DIREKAM DENGAN " .. #rotaGravada .. " LOKASI!")
            end
        end
        antiKick()
        gg.sleep(100)
    end
    
    return rotaGravada
end

function executarFarmMinaBlabeidi(rota, velocidade, tempoEspera, distMinima)
    if not rota or #rota < 2 then
        gg.toast("❌ RUTE TIDAK VALID!")
        return false
    end
    
    if farmMinaBlabeidiAtivo then
        gg.toast("⏳ PETERNAKAN TERSEBUT SUDAH BEROPERASI.!")
        return false
    end
    
    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ PEMAIN TIDAK DITEMUKAN!")
        return false
    end
    
    farmMinaBlabeidiAtivo = true
    checkpointAtualMina = 1
    ciclosMina = 0
    coletasMina = 0
    local tempoInicio = os.time()
    
    gg.toast("⛏️ AUTO TAMBANG DIMULAI DENGAN ANTI-KICK!")
    
    while farmMinaBlabeidiAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local tempoDecorrido = os.time() - tempoInicio
            local minutos = math.floor(tempoDecorrido / 60)
            local segundos = tempoDecorrido % 60
            
            local escolha = gg.alert(
                "⛏️ MINA BLABEIDI\n" ..
                "─────────────────\n" ..
                "📍 LOKASI: " .. checkpointAtualMina .. "/" .. #rota .. "\n" ..
                "🔄 SIKLUS: " .. ciclosMina .. "\n" ..
                "📦 KOLEKSI: " .. coletasMina .. "\n" ..
                "⏱️ WAKTU: " .. string.format("%02d:%02d", minutos, segundos) .. "\n" ..
                "─────────────────",
                "🛑 BERHENTI",
                "⏭️ SKIP",
                "📊 STATISTIK"
            )
            
            if escolha == 1 then
                farmMinaBlabeidiAtivo = false
                gg.toast("⏹️ PERTANIAN TERGANGGU!")
                break
            elseif escolha == 2 then
                checkpointAtualMina = checkpointAtualMina + 1
                if checkpointAtualMina > #rota then checkpointAtualMina = 1 end
                gg.toast("⏭️ Pulando para ponto " .. checkpointAtualMina)
            elseif escolha == 3 then
                gg.alert(
                    "📊 STATISTIK\n\n" ..
                    "📍 LOKASI: " .. #rota .. "\n" ..
                    "🔄 SIKLUS: " .. ciclosMina .. "\n" ..
                    "📦 KOLEKSI: " .. coletasMina .. "\n" ..
                    "⏱️ WAKTU: " .. string.format("%02d:%02d", minutos, segundos) .. "\n" ..
                    "⚡ KECEPATAN: " .. velocidade .. "x\n" ..
                    "⏳ TUNGGU: " .. tempoEspera .. "s",
                    "OK"
                )
            end
        end
        
        antiKick()
        
        local posY = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
        if posY and posY[1] and posY[1].value < 900 then
            gg.toast("⚠️ Void detectado! Teleportando...")
            TP(pontoSeguroMina.x, pontoSeguroMina.y, pontoSeguroMina.z)
            gg.sleep(500)
            checkpointAtualMina = 1
        else
            local alvo = rota[checkpointAtualMina]
            local pos = gg.getValues({
                {address = addrX, flags = gg.TYPE_FLOAT},
                {address = addrY, flags = gg.TYPE_FLOAT},
                {address = addrZ, flags = gg.TYPE_FLOAT}
            })
            
            local dx = alvo.x - pos[1].value
            local dy = alvo.y - pos[2].value
            local dz = alvo.z - pos[3].value
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            
            if dist < distMinima then
                coletasMina = coletasMina + 1
                gg.toast("⛏️ MENGUMPULKAN DI: " .. alvo.nome)
                
                for i = 1, tempoEspera do
                    if not farmMinaBlabeidiAtivo then break end
                    antiKick()
                    gg.sleep(1000)
                end
                
                checkpointAtualMina = checkpointAtualMina + 1
                if checkpointAtualMina > #rota then
                    checkpointAtualMina = 1
                    ciclosMina = ciclosMina + 1
                    gg.toast("🔄 SIKLUS " .. ciclosMina .. " COMPLETE!")
                end
            else
                local passo = velocidade / 10
                local nx = pos[1].value + (dx / dist) * passo
                local ny = pos[2].value + (dy / dist) * passo
                local nz = pos[3].value + (dz / dist) * passo
                
                gg.setValues({
                    {address = addrX, value = nx, flags = gg.TYPE_FLOAT},
                    {address = addrY, value = ny, flags = gg.TYPE_FLOAT},
                    {address = addrZ, value = nz, flags = gg.TYPE_FLOAT}
                })
            end
        end
        
        gg.sleep(50)
    end
    
    return true
end

function menuFarmMinaBlabeidi()
    local opcao = gg.choice({
        "🆕 REKAM RUTE BARU",
        "📋 MUAT RUTE DEFAULT",
        "▶️ MEMULAI PERTAMBANGAN",
        "⏹️ BERHENTI MENAMBANG",
        "📊 LIHAT RUTE SAAT INI",
        "↩️ KEMBALI"
    }, nil, "⛏️ FARM TAMBANG 2")
    
    if opcao == 1 then
        local novaRota = gravarRotaMinaBlabeidi()
        if novaRota then
            rotaMinaBlabeidi = novaRota
            gg.toast("✅ RUTE TERSIMPAN DENGAN " .. #rotaMinaBlabeidi .. " LOKASI!")
        end
        
    elseif opcao == 2 then
        rotaMinaBlabeidi = {}
        for i, ponto in ipairs(rotaPadraoMinaBlabeidi) do
            table.insert(rotaMinaBlabeidi, {x = ponto.x, y = ponto.y, z = ponto.z, nome = ponto.nome})
        end
        gg.toast("✅ RUTE STANDAR YANG DIISI DENGAN " .. #rotaMinaBlabeidi .. " LOKASI!")
        
    elseif opcao == 3 then
        if #rotaMinaBlabeidi < 2 then
            gg.alert("❌ TIDAK ADA RUTE YANG DIKONFIGURASI.!")
            return
        end
        
        local config = gg.prompt({
            "⚡ KECEPATAN:",
            "⏱️ WAKTU TUNGGU (DETIK)):",
            "📏 JARAK MINIMUM:"
        }, {
            tostring(SPEED_MINA),
            tostring(TEMPO_ESPERA_PADRAO),
            tostring(DIST_MIN)
        }, {"number", "number", "number"})
        
        if config then
            local velocidade = tonumber(config[1]) or SPEED_MINA
            local tempoEspera = tonumber(config[2]) or TEMPO_ESPERA_PADRAO
            local distMinima = tonumber(config[3]) or DIST_MIN
            
            executarFarmMinaBlabeidi(rotaMinaBlabeidi, velocidade, tempoEspera, distMinima)
        end
        
    elseif opcao == 4 then
        if farmMinaBlabeidiAtivo then
            farmMinaBlabeidiAtivo = false
            gg.toast("⏹️ PERTANIAN MINA BLABEIDI BERHENTI!")
        else
            gg.toast("📴 TIDAK ADA KEGIATAN PERTANIAN")
        end
        
    elseif opcao == 5 then
        if #rotaMinaBlabeidi == 0 then
            gg.alert("❌ TIDAK ADA RUTE YANG DIKONFIGURASI.!")
            return
        end
        
        local texto = "📋 RUTE SAAT INI - TAMBANG\n\n"
        for i, ponto in ipairs(rotaMinaBlabeidi) do
            texto = texto .. string.format(
                "📍 %s: X:%.2f Y:%.2f Z:%.2f\n",
                ponto.nome, ponto.x, ponto.y, ponto.z
            )
        end
        gg.alert(texto, "OK")
    end
end

-- ==========================================
-- FARM FAZENDA EMBAIXO DA TERRA (7 CHECKPOINTS + SUBIDA)
-- ==========================================
function gravarRotaFazendaTerra()
    if not addrZ and not buscarBasePlayer() then 
        gg.toast("❌ PEMAIN TIDAK DITEMUKAN!")
        return nil
    end
    
    gg.alert(
        "🌾 REKOR RUTE - PERTANIAN PERMUKAAN TANAH\n\n" ..
        "1️⃣ Pergi ke titik yang diinginkan di lahan pertanian (PERMUKAAN))\n" ..
        "2️⃣ Klik ikon GG untuk menyimpan.\n" ..
        "3️⃣ Ulangi langkah ini untuk semua 7 titik.\n" ..
        "4️⃣ Lokasi ke-8 akan ditambahkan SECARA OTOMATIS.\n" ..
        "   untuk memindahkanmu ke PERMUKAAN TANAH!\n" ..
        "5️⃣ Setelah dikumpulkan, tulisan SUBE muncul ke permukaan.\n\n" ..
        "📌 Minimal: Diperlukan 7 Lokasi.\n" ..
        "🛡️ ANTI-KICK AKTIF!",
        "DIPAHAMI"
    )
    
    local rotaGravada = {}
    local gravando = true
    local MAX_PONTOS = 7
    
    gg.toast("📍 KUBURAN " .. MAX_PONTOS .. " TITIK-TITIK DI PERTANIAN (PERMUKAAN))")
    
    while gravando do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local pos = gg.getValues({
                {address = addrX, flags = gg.TYPE_FLOAT},
                {address = addrY, flags = gg.TYPE_FLOAT},
                {address = addrZ, flags = gg.TYPE_FLOAT}
            })
            
            local opcao = gg.alert(
                "📍 LOKASI " .. (#rotaGravada + 1) .. "/" .. MAX_PONTOS .. "\n" ..
                "X: " .. string.format("%.2f", pos[1].value) .. "\n" ..
                "Y: " .. string.format("%.2f", pos[2].value) .. "\n" ..
                "Z: " .. string.format("%.2f", pos[3].value) .. "\n\n" ..
                "📊 LOKASI TERSIMPAN: " .. #rotaGravada,
                "💾 MENYIMPAN",
                "🗑️ PENGHILANG",
                "✅ MENYELESAIKAN"
            )
            
            if opcao == 1 then
                if #rotaGravada < MAX_PONTOS then
                    table.insert(rotaGravada, {
                        x = pos[1].value,
                        y = pos[2].value,
                        z = pos[3].value,
                        nome = "🌾 BIDANG " .. (#rotaGravada + 1)
                    })
                    gg.toast("✅ LOKASI " .. #rotaGravada .. " TERSIMPAN! (" .. #rotaGravada .. "/" .. MAX_PONTOS .. ")")
                else
                    gg.toast("⚠️ INI SUDAH MENCAPAI BATAS MAKSIMUMNYA. " .. MAX_PONTOS .. " LOKASI!")
                end
                
            elseif opcao == 2 then
                if #rotaGravada > 0 then
                    table.remove(rotaGravada)
                    gg.toast("🗑️ LOKASI DIHAPUS! (" .. #rotaGravada .. "/" .. MAX_PONTOS .. ")")
                end
                
            elseif opcao == 3 then
                if #rotaGravada < MAX_PONTOS then
                    gg.alert("❌ MINIMUM " .. MAX_PONTOS .. " LOKASI PENTING!\nANDA MENYIMPAN: " .. #rotaGravada)
                else
                    gravando = false
                    gg.toast("✅ RUTE DIREKAM DENGAN " .. #rotaGravada .. " LOKASI!")
                end
            end
        end
        antiKick()
        gg.sleep(100)
    end
    
    return rotaGravada
end

function adicionarPontoEmbaixoTerra(rota)
    if not rota or #rota == 0 then
        gg.toast("❌ RUTE KOSONG!")
        return nil
    end
    
    local novaRota = {}
    for i, ponto in ipairs(rota) do
        table.insert(novaRota, {x = ponto.x, y = ponto.y, z = ponto.z, nome = ponto.nome})
    end
    
    local ultimoPonto = rota[#rota]
    table.insert(novaRota, {
        x = ultimoPonto.x,
        y = -20.0,
        z = ultimoPonto.z,
        nome = "🌍 PERMUKAAN TANAH (TP))"
    })
    
    gg.toast("✅ Ponto 'EMBAIXO DA TERRA' adicionado automaticamente!")
    return novaRota
end

function executarFarmFazendaTerra(velocidade, tempoEspera, distMinima)
    if #rotaFazendaTerra < 2 then
        gg.toast("❌ RUTE TIDAK VALID! DAPATKAN MINIMAL 7 POIN!")
        return false
    end
    
    if farmFazendaTerraAtivo then
        gg.toast("⏳ PETERNAKAN TERSEBUT SUDAH BEROPERASI.!")
        return false
    end
    
    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ PEMAIN TIDAK DITEMUKAN!")
        return false
    end
    
    farmFazendaTerraAtivo = true
    checkpointAtualTerra = 1
    ciclosTerra = 0
    coletasTerra = 0
    local tempoInicio = os.time()
    
    -- Teleporta para o ponto abaixo da terra (8º ponto)
    local ultimoPonto = rotaFazendaTerra[#rotaFazendaTerra]
    TP(ultimoPonto.x, ultimoPonto.y, ultimoPonto.z)
    gg.sleep(500)
    
    gg.toast("🌾 Pertanian Bawah Tanah Dimulai!")
    gg.toast("⚠️ KAMU BERADA DI LOKASI! MENGUMPULKAN...")
    
    while farmFazendaTerraAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            
            local tempoDecorrido = os.time() - tempoInicio
            local minutos = math.floor(tempoDecorrido / 60)
            local segundos = tempoDecorrido % 60
            
            local escolha = gg.alert(
                "🌾 AUTO FARM PERTANIAN\n" ..
                "─────────────────────────\n" ..
                "📍 POINTER: " .. checkpointAtualTerra .. "/" .. (#rotaFazendaTerra - 1) .. "\n" ..
                "🔄 Siklus: " .. ciclosTerra .. "\n" ..
                "📦 Koleksi: " .. coletasTerra .. "\n" ..
                "⏱️ Waktu: " .. string.format("%02d:%02d", minutos, segundos) .. "\n" ..
                "─────────────────────────",
                "🛑 BERHENTI",
                "⏭️ SKIP",
                "📊 STATISTIK"
            )
            
            if escolha == 1 then
                farmFazendaTerraAtivo = false
                TP(pontoSuperficie.x, pontoSuperficie.y, pontoSuperficie.z)
                gg.toast("⏹️ KEGIATAN DI PERTANIAN TERGANGGU! KEMBALI KE PERMUKAAN.!")
                break
            elseif escolha == 2 then
                checkpointAtualTerra = checkpointAtualTerra + 1
                if checkpointAtualTerra > (#rotaFazendaTerra - 1) then 
                    checkpointAtualTerra = 1 
                    ciclosTerra = ciclosTerra + 1
                    gg.toast("🔄 Siklus " .. ciclosTerra .. " Sukses!")
                    TP(rotaFazendaTerra[#rotaFazendaTerra].x, -20.0, rotaFazendaTerra[#rotaFazendaTerra].z)
                    gg.sleep(300)
                end
                gg.toast("⏭️ Pulando para ponto " .. checkpointAtualTerra)
            elseif escolha == 3 then
                gg.alert(
                    "📊 STATISTIK\n\n" ..
                    "📍 LOKASI: " .. (#rotaFazendaTerra - 1) .. "\n" ..
                    "🔄 SIKLUS: " .. ciclosTerra .. "\n" ..
                    "📦 KOLEKSI: " .. coletasTerra .. "\n" ..
                    "⏱️ WAKTU: " .. string.format("%02d:%02d", minutos, segundos) .. "\n" ..
                    "⚡ KECEPATAN: " .. velocidade .. "x\n" ..
                    "⏳ TUNGGU: " .. tempoEspera .. "s\n" ..
                    "🌍 LOKASI: PERMUKAAN TANAH",
                    "OK"
                )
            end
        end
        
        antiKick()
        
        -- Verifica se está abaixo da terra
        local posY = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
        if posY[1].value > 0 then
            gg.toast("⚠️ ANDA BERADA DI PERMUKAAN! BERTELEPORTASI KE PERMUKAAN TANAH...")
            TP(rotaFazendaTerra[#rotaFazendaTerra].x, -20.0, rotaFazendaTerra[#rotaFazendaTerra].z)
            gg.sleep(500)
        end
        
        local alvo = rotaFazendaTerra[checkpointAtualTerra]
        local pos = gg.getValues({
            {address = addrX, flags = gg.TYPE_FLOAT},
            {address = addrY, flags = gg.TYPE_FLOAT},
            {address = addrZ, flags = gg.TYPE_FLOAT}
        })
        
        local dx = alvo.x - pos[1].value
        local dy = alvo.y - pos[2].value
        local dz = alvo.z - pos[3].value
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        
        if dist < distMinima then
            coletasTerra = coletasTerra + 1
            gg.toast("🌾 MENGUMPULKAN DI: " .. alvo.nome)
            
            for i = 1, tempoEspera do
                if not farmFazendaTerraAtivo then break end
                antiKick()
                
                local checkY = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
                if checkY[1].value > 0 then
                    gg.setValues({{address = addrY, value = -20.0, flags = gg.TYPE_FLOAT}})
                end
                
                gg.sleep(1000)
            end
            
            local proximoPonto = checkpointAtualTerra + 1
            
            if proximoPonto > (#rotaFazendaTerra - 1) then
                gg.toast("☀️ NAIK KE PERMUKAAN...")
                TP(alvo.x, 10.735, alvo.z)
                gg.sleep(300)
                checkpointAtualTerra = 1
                ciclosTerra = ciclosTerra + 1
                gg.toast("🔄 SIKLUS " .. ciclosTerra .. " SELESAI!")
                
                TP(rotaFazendaTerra[#rotaFazendaTerra].x, -20.0, rotaFazendaTerra[#rotaFazendaTerra].z)
                gg.sleep(500)
            else
                local prox = rotaFazendaTerra[proximoPonto]
                gg.toast("⬇️ Indo para: " .. prox.nome)
                
                TP(prox.x, -20.0, prox.z)
                gg.sleep(200)
                
                gg.toast("☀️ MUNCUL KE PERMUKAAN DI: " .. prox.nome)
                TP(prox.x, 10.735, prox.z)
                gg.sleep(300)
                
                gg.toast("⬇️ KEMBALI KE PERMUKAAN TANAH...")
                TP(prox.x, -20.0, prox.z)
                gg.sleep(300)
                
                checkpointAtualTerra = proximoPonto
            end
        else
            local passo = velocidade / 10
            local nx = pos[1].value + (dx / dist) * passo
            local ny = pos[2].value + (dy / dist) * passo
            local nz = pos[3].value + (dz / dist) * passo
            
            gg.setValues({
                {address = addrX, value = nx, flags = gg.TYPE_FLOAT},
                {address = addrY, value = ny, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = nz, flags = gg.TYPE_FLOAT}
            })
        end
        
        gg.sleep(50)
    end
    
    if farmFazendaTerraAtivo == false then
        TP(pontoSuperficie.x, pontoSuperficie.y, pontoSuperficie.z)
        gg.toast("☀️ KEMBALI KE PERMUKAAN...")
    end
    
    return true
end

function menuFarmFazendaTerra()
    local opcao = gg.choice({
        "🆕 REKAM 7 POIN",
        "📋 MUAT RUTE DEFAULT",
        "▶️ MEMULAI PERTANIAN",
        "⏹️ BERHENTI BERTANI",
        "📊 LIHAT RUTE",
        "↩️ KEMBALI"
    }, nil, "🌾 AUTO PERTANIAN")
    
    if opcao == 1 then
        local novaRota = gravarRotaFazendaTerra()
        if novaRota then
            rotaFazendaTerra = adicionarPontoEmbaixoTerra(novaRota)
            gg.toast("✅ RUTE TERSELAMATKAN DENGAN " .. #rotaFazendaTerra .. " LOKASI (7 + 1 TP)!")
        end
        
    elseif opcao == 2 then
        rotaFazendaTerra = {}
        local rotaPadrao = {
            {nome = "🌾 BIDANG 1", x = 190.13, y = 10.51, z = -2477.59},
            {nome = "🌾 BIDANG 2", x = 210.50, y = 10.30, z = -2490.00},
            {nome = "🌾 BIDANG 3", x = 230.80, y = 10.20, z = -2505.50},
            {nome = "🌾 BIDANG 4", x = 250.00, y = 10.10, z = -2520.00},
            {nome = "🌾 BIDANG 5", x = 270.30, y = 10.00, z = -2535.80},
            {nome = "🌾 BIDANG 6", x = 250.00, y = 10.10, z = -2520.00},
            {nome = "🌾 BIDANG 7", x = 230.80, y = 10.20, z = -2505.50}
        }
        rotaFazendaTerra = adicionarPontoEmbaixoTerra(rotaPadrao)
        gg.toast("✅ RUTE STANDAR YANG SARAT DENGAN " .. #rotaFazendaTerra .. " poin!")
        
    elseif opcao == 3 then
        if #rotaFazendaTerra < 2 then
            gg.alert("❌ TIDAK ADA RUTE YANG DIKONFIGURASI.!")
            return
        end
        
        local config = gg.prompt({
            "⚡ KECEPATAN TP:",
            "⏱️ WAKTU TUNGGU (Detik):",
            "📏 JARAK MINIMUM:"
        }, {
            tostring(6.0),
            tostring(6),
            tostring(1.5)
        }, {"number", "number", "number"})
        
        if config then
            local velocidade = tonumber(config[1]) or 6.0
            local tempoEspera = tonumber(config[2]) or 6
            local distMinima = tonumber(config[3]) or 1.5
            
            executarFarmFazendaTerra(velocidade, tempoEspera, distMinima)
        end
        
    elseif opcao == 4 then
        if farmFazendaTerraAtivo then
            farmFazendaTerraAtivo = false
            TP(pontoSuperficie.x, pontoSuperficie.y, pontoSuperficie.z)
            gg.toast("⏹️ PERTANIAN PERMUKAAN TANAH, BERHENTI!")
        else
            gg.toast("📴 TIDAK ADA PERTANIAN YANG BEROPERASI.")
        end
        
    elseif opcao == 5 then
        if #rotaFazendaTerra == 0 then
            gg.alert("❌ TIDAK ADA RUTE YANG DIKONFIGURASI.!")
            return
        end
        
        local texto = "📋 RUTE - PERTANIAN BAWAH TANAH\n\n"
        for i, ponto in ipairs(rotaFazendaTerra) do
            if i == #rotaFazendaTerra then
                texto = texto .. "🔽 " .. ponto.nome .. ": X:" .. string.format("%.2f", ponto.x) .. " Y:" .. string.format("%.2f", ponto.y) .. " Z:" .. string.format("%.2f", ponto.z) .. " ⚠️ DI PERMUKAAN\n"
            else
                texto = texto .. "📍 " .. ponto.nome .. ": X:" .. string.format("%.2f", ponto.x) .. " Y:" .. string.format("%.2f", ponto.y) .. " Z:" .. string.format("%.2f", ponto.z) .. "\n"
            end
        end
        gg.alert(texto, "OK")
    end
end

function inicializarPlayerOnibus()
    if not addrZ then
        if not buscarBasePlayer() then return false end
    end
    playerObtido_Onibus = true
    gg.toast("✅ PEMAIN DIINISIALISASI UNTUK BUS")
    return true
end

function pesquisarESalvarEnderecos_Onibus()
    gg.clearResults()
    gg.toast("🔍 MENCARI BUS...")
    
    gg.searchNumber("-303~-291", gg.TYPE_FLOAT)
    gg.sleep(500)
    
    local resultadosIniciais = gg.getResults(200)
    if #resultadosIniciais == 0 then
        gg.toast("❌ TIDAK ADA ALAMAT YANG DITEMUKAN PADA PENCARIAN PERTAMA.!")
        gg.clearResults()
        return false
    end
    
    gg.toast("🚶 GERAKKAN KARAKTER ANDA....")
    gg.sleep(3000)
    
    gg.refineNumber("-303~-291", gg.TYPE_FLOAT)
    gg.toast("🚶 GERAKKAN KARAKTERMU LAGI....")
    gg.sleep(2000)
    gg.refineNumber("-303~-291", gg.TYPE_FLOAT)
    gg.toast("🚌 PERGILAH KE SISI BUS.")
    gg.sleep(2000)
    gg.refineNumber("-303~-291", gg.TYPE_FLOAT)
    gg.toast("🚌 NAIKLAH BUS DAN PERGI KE KONTAINER BIRU (15 DETIK)")
    gg.sleep(15000)
    gg.refineNumber("-255~-230", gg.TYPE_FLOAT)
    
    local resultadosFiltrados = gg.getResults(100)
    if #resultadosFiltrados > 0 then
        enderecosY_Onibus = {}
        enderecosCompletos_Onibus = {}
        
        for i, resultado in ipairs(resultadosFiltrados) do
            local yAddr = resultado.address
            enderecosY_Onibus[i] = yAddr
            enderecosCompletos_Onibus[i] = {
                y = yAddr,
                x = yAddr + 4,
                z = yAddr + 8
            }
        end
        
        gg.toast(string.format("✅ %d ALAMAT BUS YANG TERSIMPAN!", #enderecosY_Onibus))
        onibusObtido = true
        gg.clearResults()
        return true
    else
        gg.toast("❌ TIDAK ADA ALAMAT YANG DITEMUKAN SETELAH PENYARINGAN.!")
        gg.clearResults()
        return false
    end
end

function pesquisarCheckpointPreciso_Onibus()
    gg.clearResults()
    gg.toast("🎯 Mendapatkan rute pengiriman...")
    
    gg.searchNumber(PRIMEIRA_BUSCA, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.sleep(500)
    
    local resultadosIniciais = gg.getResults(200)
    if #resultadosIniciais == 0 then
        gg.toast("❌ Tidak ada hasil pada pencarian pertama.!")
        gg.clearResults()
        return false
    end
    
    teleportarOnibusEPlayer(-333.24081420898, -1277.98217773438, 10.36108493805, false)
    gg.sleep(2000)
    
    teleportarOnibusEPlayer(-720.6337890625, -1311.76403808594, 18.96370315552, false)
    gg.sleep(1000)
    
    gg.toast("✅ MEMULAI")
    
    gg.searchNumber(SEGUNDA_BUSCA, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.sleep(500)
    
    local resultadosFiltrados = gg.getResults(3)
    if #resultadosFiltrados >= 3 then
        enderecosCheckpoint = {}
        table.sort(resultadosFiltrados, function(a, b) return a.address < b.address end)
        
        enderecosCheckpoint = {
            y = resultadosFiltrados[1].address,
            x = resultadosFiltrados[2].address,
            z = resultadosFiltrados[3].address
        }
        
        local itensParaLista = {
            [1] = {address = enderecosCheckpoint.y, flags = gg.TYPE_FLOAT, value = resultadosFiltrados[1].value, name = "📍 CP_Y", freeze = false},
            [2] = {address = enderecosCheckpoint.x, flags = gg.TYPE_FLOAT, value = resultadosFiltrados[2].value, name = "📍 CP_X", freeze = false},
            [3] = {address = enderecosCheckpoint.z, flags = gg.TYPE_FLOAT, value = resultadosFiltrados[3].value, name = "📍 CP_Z", freeze = false}
        }
        
        gg.addListItems(itensParaLista)
        itensNaLista_Onibus = itensParaLista
        
        gg.toast("✅ Rute berhasil disimpan!")
        checkpointObtido = true
        farmTesteOnibus_Integrado()
        gg.clearResults()
        return true
    else
        gg.toast("❌ Checkpoint tidak ditemukan setelah penyaringan.!")
        gg.clearResults()
        return false
    end
end

function teleportarOnibus(y, x, z, congelar)
    if #enderecosY_Onibus == 0 then return false end
    
    local valoresTeleporte = {}
    local index = 1
    
    for i, yAddr in ipairs(enderecosY_Onibus) do
        valoresTeleporte[index] = {address = yAddr, flags = gg.TYPE_FLOAT, value = y, freeze = false}
        index = index + 1
        valoresTeleporte[index] = {address = yAddr + 4, flags = gg.TYPE_FLOAT, value = x, freeze = false}
        index = index + 1
        valoresTeleporte[index] = {address = yAddr + 8, flags = gg.TYPE_FLOAT, value = z, freeze = false}
        index = index + 1
    end
    
    gg.setValues(valoresTeleporte)
    
    if congelar then
        gg.addListItems(valoresTeleporte)
    end
    
    return true
end

function teleportarPlayerOnibus(y, x, z, congelar)
    if not addrZ then
        if not buscarBasePlayer() then return false end
    end
    
    local valoresPlayer = {
        [1] = {address = addrX, flags = gg.TYPE_FLOAT, value = x, freeze = false},
        [2] = {address = addrY, flags = gg.TYPE_FLOAT, value = y, freeze = false},
        [3] = {address = addrZ, flags = gg.TYPE_FLOAT, value = z, freeze = false}
    }
    
    gg.setValues(valoresPlayer)
    
    if congelar then
        gg.addListItems({valoresPlayer[3]})
    end
    
    return true
end

function teleportarOnibusEPlayer(y, x, z, congelar)
    local onibusOk = teleportarOnibus(y, x, z, congelar)
    local playerOk = teleportarPlayerOnibus(y, x, z, congelar)
    
    if onibusOk and playerOk then
        return true
    else
        gg.toast("❌ Kesalahan teleportasi!")
        return false
    end
end

function descongelarTudo_Onibus()
    if #enderecosY_Onibus > 0 then
        local itensRemover = {}
        local index = 1
        for i, yAddr in ipairs(enderecosY_Onibus) do
            itensRemover[index] = {address = yAddr, flags = gg.TYPE_FLOAT}
            index = index + 1
            itensRemover[index] = {address = yAddr + 4, flags = gg.TYPE_FLOAT}
            index = index + 1
            itensRemover[index] = {address = yAddr + 8, flags = gg.TYPE_FLOAT}
            index = index + 1
        end
        gg.removeListItems(itensRemover)
    end
    
    if addrZ then
        gg.removeListItems({{address = addrZ, flags = gg.TYPE_FLOAT}})
    end
    
    return true
end

function getCheckpointAtualizado_Onibus()
    if next(enderecosCheckpoint) == nil then return nil end
    
    gg.clearResults()
    local enderecosParaLer = {
        [1] = {address = enderecosCheckpoint.y, flags = gg.TYPE_FLOAT},
        [2] = {address = enderecosCheckpoint.x, flags = gg.TYPE_FLOAT},
        [3] = {address = enderecosCheckpoint.z, flags = gg.TYPE_FLOAT}
    }
    
    local valoresLidos = gg.getValues(enderecosParaLer)
    
    if valoresLidos and #valoresLidos >= 3 then
        return {
            y = valoresLidos[1].value,
            x = valoresLidos[2].value,
            z = valoresLidos[3].value
        }
    else
        gg.toast("⚠️ Terjadi kesalahan saat membaca koordinat.!")
        return nil
    end
end

function teleportarParaCheckpoint_Onibus()
    if #enderecosY_Onibus == 0 then
        gg.toast("⚠️ Tidak ada alamat bus yang tersimpan.!")
        return false
    end
    
    if next(enderecosCheckpoint) == nil then
        gg.toast("⚠️ Tidak ada titik pemeriksaan yang tersimpan.!")
        return false
    end
    
    if not addrZ then
        if not buscarBasePlayer() then return false end
    end
    
    local coordsAtuais = getCheckpointAtualizado_Onibus()
    
    if coordsAtuais then
        if teleportarOnibusEPlayer(coordsAtuais.y, coordsAtuais.x, coordsAtuais.z + 1, true) then
            return true
        end
    end
    
    return false
end

function farmTesteOnibus_Integrado()
    if #enderecosY_Onibus == 0 then
        gg.toast("⚠️ Tidak ada alamat bus yang tersimpan.!")
        return false
    end
    
    if next(enderecosCheckpoint) == nil then
        gg.toast("⚠️ Tidak ada titik pemeriksaan yang tersimpan.!")
        return false
    end
    
    if farmOnibusAtivo then
        gg.toast("⏸️ Auto Farm tersebut sudah beroperasi.!")
        return false
    end
    
    farmOnibusAtivo = true
    
    local ultimoCheckpoint = {y = 0, x = 0, z = 0}
    local repeticoes = 0
    local iteracao = 0
    
    while farmOnibusAtivo do
        iteracao = iteracao + 1
        
        local coordsAtuais = getCheckpointAtualizado_Onibus()
        
        if coordsAtuais then
            local mesmoCheckpoint = (
                math.abs(coordsAtuais.y - ultimoCheckpoint.y) < 15.1 and
                math.abs(coordsAtuais.x - ultimoCheckpoint.x) < 15.1 and
                math.abs(coordsAtuais.z - ultimoCheckpoint.z) < 15.1
            )
            
            if mesmoCheckpoint then
                repeticoes = repeticoes + 1
                
                if repeticoes >= 3 then
                    gg.toast("⏳ Titik akhir terdeteksi! Menunggu 5 detik...")
                    
                    descongelarTudo_Onibus()
                    teleportarOnibusEPlayer(1759.343383789063, -2644.426025390625, 1.5, false)
                    
                    for s = 5, 1, -1 do
                        if not farmOnibusAtivo then break end
                        gg.toast(string.format("⏳ Aguardando %d segundos...", s))
                        gg.sleep(1000)
                    end
                    
                    repeticoes = 0
                    gg.toast("🔄 AUTO FARM DI LANJUTKAN...")
                end
            else
                repeticoes = 0
            end
            
            ultimoCheckpoint = coordsAtuais
            
            if teleportarParaCheckpoint_Onibus() then
                gg.toast("👑 AUTO FARM BUS AKTIF 👑")
            else
                gg.toast("❌ Terjadi kesalahan di pertanian!")
                farmOnibusAtivo = false
                return false
            end
            descongelarTudo_Onibus()
            gg.sleep(3500)
        else
            gg.toast("⚠️ Terjadi kesalahan saat mendapatkan titik pemeriksaan.!")
            farmOnibusAtivo = false
            return false
        end
        
        gg.sleep(100)
    end
    
    gg.toast(string.format("⏹️ Pertanian terganggu! Iterasi: %d", iteracao))
    farmOnibusAtivo = false
    return true
end

function pararFarmOnibus_Integrado()
    if farmOnibusAtivo then
        farmOnibusAtivo = false
        descongelarTudo_Onibus()
        gg.toast("⏹️ Auto Farm Bus berhenti!")
    else
        gg.toast("📴 Tidak ada terminal bus yang beroperasi.")
    end
end

function limparListaGG_Onibus_Integrado()
    if next(itensNaLista_Onibus) ~= nil then
        gg.removeListItems(itensNaLista_Onibus)
        itensNaLista_Onibus = {}
        gg.toast("🧹 Daftar GG (bus) dibersihkan!")
    end
end

function menuOnibusIntegrado()
    local opcoes = {}
    
    if not playerObtido_Onibus then
        table.insert(opcoes, "🔍 1. DAPATKAN POSISI PEMAIN")
    end
    
    if not onibusObtido then
        table.insert(opcoes, "🚌 2. DAPATKAN POSISI BUS")
    end
    
    if playerObtido_Onibus and onibusObtido and not checkpointObtido then
        table.insert(opcoes, "🎯 3. Raih titik pemeriksaan dan mulailah.")
    end
    
    if farmOnibusAtivo then
        table.insert(opcoes, "⏹️ 4. BERHENTI")
    end
    
    table.insert(opcoes, "🏢 5. TELEPORTASI KE TEMPAT KERJA")
    table.insert(opcoes, "🔙 6. KEMBALI KE MENU UTAMA")
    
    local opcao = gg.choice(opcoes, nil, "🚌 MENU FARM BUS 🚌")
    
    if opcao == nil then return end
    
    local idx = 1
    
    if not playerObtido_Onibus then
        if opcao == idx then
            inicializarPlayerOnibus()
            return
        end
        idx = idx + 1
    end
    
    if not onibusObtido then
        if opcao == idx then
            pesquisarESalvarEnderecos_Onibus()
            return
        end
        idx = idx + 1
    end
    
    if playerObtido_Onibus and onibusObtido and not checkpointObtido then
        if opcao == idx then
            pesquisarCheckpointPreciso_Onibus()
            return
        end
        idx = idx + 1
    end
    
    if farmOnibusAtivo and opcao == idx then
        pararFarmOnibus_Integrado()
        return
    elseif farmOnibusAtivo then
        idx = idx + 1
    end
    
    if opcao == idx then
        TP(-306.140716552734, -1380.51025390625, 11.6)
        return
    end
    idx = idx + 1
    
    if opcao == idx then
        limparListaGG_Onibus_Integrado()
        menu_principal()
    end
end

local checkpointsMina = {
    {nome = "ENTRADA",   x = 19.4, y = 1012.2, z = 859.3},
    {nome = "CORREDOR",  x = 21.1, y = 1012.1, z = 833.7},
    {nome = "FUNDO",     x = 23.2, y = 1009.6, z = 807.9},
    {nome = "VOLTA",     x = 21.0, y = 1012.0, z = 833.5},
    {nome = "REINICIO",  x = 19.2, y = 1012.3, z = 859.5}
}

function farmMinaBot()
    if not addrZ and not buscarBasePlayer() then return end
    local farmMinaAtivo = true
    local cp = 1
    gg.toast("⛏️ Farm Mina Iniciado!")
    while farmMinaAtivo do
        if gg.isVisible() then
            gg.setVisible(false)
            local escolha = gg.alert("⛏️ TAMBANG AKTIF", "🛑 BERHENTI", "⏭ SKIP")
            if escolha == 1 then 
                farmMinaAtivo = false
                break 
            elseif escolha == 2 then
                cp = cp + 1
                if cp > #checkpointsMina then cp = 1 end
            end
        end
        local posY = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})[1].value
        if posY < 900 then
            TP(checkpointsMina[1].x, checkpointsMina[1].y, checkpointsMina[1].z)
            cp = 1
        end
        local alvo = checkpointsMina[cp]
        local pos = gg.getValues({
            {address = addrX, flags = gg.TYPE_FLOAT}, 
            {address = addrY, flags = gg.TYPE_FLOAT}, 
            {address = addrZ, flags = gg.TYPE_FLOAT}
        })
        local dx, dy, dz = alvo.x - pos[1].value, alvo.y - pos[2].value, alvo.z - pos[3].value
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        if dist < DIST_MIN then
            gg.toast("⛏️ Mengumpulkan di: " .. alvo.nome)
            gg.sleep(6000)
            cp = cp + 1
            if cp > #checkpointsMina then cp = 1 end
        else
            local nx = pos[1].value + (dx / dist) * SPEED_MINA
            local ny = pos[2].value + (dy / dist) * SPEED_MINA
            local nz = pos[3].value + (dz / dist) * SPEED_MINA
            gg.setValues({
                {address = addrX, value = nx, flags = gg.TYPE_FLOAT}, 
                {address = addrY, value = ny, flags = gg.TYPE_FLOAT}, 
                {address = addrZ, value = nz, flags = gg.TYPE_FLOAT}
            })
        end
        gg.sleep(70)
    end
end
-- ==========================================
-- 🆕 MENU FARM ATUALIZADO
-- ==========================================
function menuFarm()
    local escolha = gg.choice({
        "🧑🏻‍🌾 AUTO TANI",
        "🧑🏻‍🌾 AUTO TANI ( INSTANT )",
        "⛏️ AUTO TAMBANG",
        "⛏️ AUTO TAMBANG ( INSTANT )",
        "⛏️ AUTO TAMBANG ( ⚡INSTANT⚡ )",
        "🚌 AUTO BUS",
        "◀️ KEMBALI"
    }, nil, "🚀 AUTO PILOT KERJA")
    if escolha == 1 then farmFazendaBot()
    elseif escolha == 2 then menuFarmFazendaBlabeidi()
    elseif escolha == 3 then farmMinaBot()
    elseif escolha == 4 then farmMinaTPCorrigido()
    elseif escolha == 5 then menuFarmMinaBlabeidi()
    elseif escolha == 6 then menuOnibusIntegrado()
    elseif escolha == 7 then menu_principal()
    end
end

function autoRun()
    local escolha = gg.choice({
        "🏃 AKTIF",
        "🏃 KABUR DARI PENJARA",
        "◀️ KEMBALI"
    }, nil, "⚡ MODE AUTO RUN")
    if escolha == 1 then Sprint()
    elseif escolha == 2 then sairDaPrisaoBot()
    elseif escolha == 3 then MenuPremium2()
    elseif escolha == 4 then menu_principal()
    end
end

function menuTeleporte()
    local escolha = gg.choice({
        "📡 TP GPS MARKER",
        "🚗 TP GPS KENDARAAN",
        "🌏 TP LOKASI TETAP.",
        "◀️ KEMBALI"
    }, nil, "⚡ MENU TELEPORT INSTANT")

    if escolha == 1 then
        TP_GPS()
    elseif escolha == 2 then
        GPS_AUTOMATICO_VEICULO()
    elseif escolha == 3 then
        local locais = {
            {"🏝️ STASIUN", -1987.606, 8.27, 445.46},
            {"🔫 TOKO SENJATA", -971.377, 11.54, -1515.79},
            {"🏢 BALAI KOTA", -1858.926, 10.69, 1457.16},
            {"⛽ POM", -1374.5211, 20.39, -1001.28},
            {"🍔 WARUNG MAKAN", -1982.1541, 8.20, 499.58},
            {"🚗 SEKOLAH MENGEMUDI", -2002.5773, 8.20, 511.02},
            {"👕 TOKO PAKAIAN", -2018.4404, 8.20, 525.75},
            {"🕶️ PASAR GELAP", -2230.20, 40.22, -2511.92},
            {"⛏️ TAMBANG", -1135.10, 43.76, -179.49},
            {"🌾 PERTANIAN", 190.13, 10.51, -2477.59},
        }
        
        local listaLocais = {}
        for i, loc in ipairs(locais) do table.insert(listaLocais, loc[1]) end
        table.insert(listaLocais, "◀️ KEMBALI")

        local subEscolha = gg.choice(listaLocais, nil, "🗺️ LOKASI PETA")
        if subEscolha and subEscolha ~= #listaLocais then
            local destino = locais[subEscolha]
            TP(destino[2], destino[3], destino[4])
        end
        elseif escolha == 4 then menu_principal()
    end
end
-- ==========================================
-- FUNÇÕES BASE (OBRIGATÓRIAS)
-- ==========================================

function SearchGet(mode, type, values)
    gg.clearResults()
    local t = {}
    for i, v in ipairs(values) do
        gg.searchNumber(v[1], gg.TYPE_STRING == type and gg.TYPE_STRING or (type == "f" and gg.TYPE_FLOAT or gg.TYPE_DWORD))
        t[i] = gg.getResults(100)
        if i < #values then
            gg.clearResults()
        end
    end
    local result = {}
    for i, v in ipairs(t[1]) do
        local valid = true
        for j = 2, #values do
            local found = false
            for k, w in ipairs(t[j]) do
                if v.address + values[j][2] == w.address then
                    found = true
                    break
                end
            end
            if not found then
                valid = false
                break
            end
        end
        if valid then
            table.insert(result, v)
        end
    end
    return result
end

function editGet(addresses, edits, type)
    if not addresses or #addresses == 0 then
        gg.toast("❌ ALAMAT TIDAK DITEMUKAN.")
        return false
    end
    local t = {}
    for i, addr in ipairs(addresses) do
        for j, edit in ipairs(edits) do
            local flags = gg.TYPE_FLOAT
            if type == "d" then
                flags = gg.TYPE_DWORD
            elseif type == "q" then
                flags = gg.TYPE_QWORD
            elseif type == "f" then
                flags = gg.TYPE_FLOAT
            end
            table.insert(t, {
                address = addr.address + (edit[2] or 0),
                flags = flags,
                value = edit[1]
            })
        end
    end
    gg.setValues(t)
    return true
end


-- ==========================================
-- NOMES DOS Criadores
-- ==========================================

local Criadores = {
    "KING TIRR MODZ",
    "TIRRZ",
    "TIRR MODS"
}
local linha_divisoria = "━━━━━━━━━━━━━━━━━━━━━"

function WallHackMenu()
    local menu = gg.choice({"AKTIF", "NONAKTIFKAN", "KEMBALI"}, nil, "🧱 WALL HACK")
    if menu == 1 then
        gg.clearResults()
        gg.searchNumber("60", gg.TYPE_FLOAT)
        gg.getResults(9999)
        gg.editAll("60.7", gg.TYPE_FLOAT)
        gg.toast("✅ Wall Hack AKTIF")
    elseif menu == 2 then
        gg.clearResults()
        gg.searchNumber("60.7", gg.TYPE_FLOAT)
        gg.getResults(9999)
        gg.editAll("60", gg.TYPE_FLOAT)
        gg.toast("✅ Wall Hack NONAKTIF")
    end
end

function ativarspeed(velocidade)
  if speedWalkCache.addresses then
    local edits = {}
    for i, addr in ipairs(speedWalkCache.addresses) do edits[i] = {address = addr, flags = gg.TYPE_FLOAT, value = velocidade} end
    gg.setValues(edits)
    gg.toast("🏃 Kecepatan Lari: " .. velocidade .. "x (Instantâneo)")
    return
  end
  gg.toast("🔍 Mencari Kecepatan... (Primeira vez)")
  gg.clearResults()
  gg.searchNumber(speedWalkCache.lastTarget, gg.TYPE_FLOAT)
  local results = gg.getResults(5000)
  speedWalkCache.addresses = {}
  local edits = {}
  for i, res in ipairs(results) do
    speedWalkCache.addresses[i] = res.address - 36
    edits[i] = {address = speedWalkCache.addresses[i], flags = gg.TYPE_FLOAT, value = velocidade}
  end
  gg.setValues(edits)
  gg.toast("🏃 Kecepatan Lari Diaktifkan: " .. velocidade .. "x")
  gg.clearResults()
end

function ativarSuperPulo(multi)
    gg.clearResults()
    gg.searchNumber("4.15768349e21", gg.TYPE_FLOAT)
    local res = gg.getResults(3000)
    for i, v in ipairs(res) do
        gg.setValues({{address = v.address - 36, flags = gg.TYPE_FLOAT, value = multi}})
    end
    gg.toast("🦘 LOMPATAN DIMODIFIKASI MENJADI: " .. multi .. "x")
end

-- KECEPATAN MENU (LARI DENGAN MOBIL)
function menuSpeed()
  local sMenu = gg.choice({
    "🏃 KECEPATAN LARI", 
    "🧎🏻 KECEPATAN JONGKOK",
    "🦅 LOMPATAN SUPER",
    "◀️ KEMBALI"
  }, nil, "⚡ MENU SUPER ⚡")
  
  if sMenu == 1 then menuSpeedLari()
  elseif sMenu == 2 then menuSpeedJongkok()
  elseif sMenu == 3 then menuSuperLompatan()
  elseif sMenu == 4 then menu_principal() end
end

function menuSpeedLari()
  local fMenu = gg.choice({
    "🏃 KECEPATAN LARI 2X", 
    "🏃 KECEPATAN LARI 4X", 
    "🏃 KECEPATAN LARI 8X", 
    "🚶 LARI NORMAL (1X)", 
    "◀️ KEMBALI"
  }, nil, "⚡ MENU SUPER ⚡")
  
  if fMenu == 1 then ativarspeed(2)
  elseif fMenu == 2 then ativarspeed(4)
  elseif fMenu == 3 then ativarspeed(8)
  elseif fMenu == 4 then ativarspeed(1)
  elseif fMenu == 5 then menuSpeed() end
end

function menuSpeedJongkok()
  local jMenu = gg.choice({
    "🧎🏻 KECEPATAN JONGKOK 2x ",
    "🧎🏻 KECEPATAN JONGKOK 4x ",
    "🧎🏻 KECEPATAN JONGKOK 6x ",
    "🧎🏻 KECEPATAN DINONAKTIFKAN ",
    "◀️ KEMBALI"
  }, nil, "⚡ MENU SUPER ⚡")
  
  if jMenu == 1 then ativarspeedagachado(2)
  elseif jMenu == 2 then ativarspeedagachado(4)
  elseif jMenu == 3 then ativarspeedagachado(8)
  elseif jMenu == 4 then ativarspeedagachado(1)
  elseif jMenu == 5 then menuSpeed() end
end

function menuSuperLompatan()
  local lMenu = gg.choice({
    "🦅 LOMPATAN 2X", 
    "🦅 LOMPATAN 4X", 
    "🦅 LOMPATAN 8X", 
    "❌ NONAKTIFKAN",
    "◀️ KEMBALI"
  }, nil, "⚡ MENU SUPER ⚡")
  
  if lMenu == 1 then ativarSuperPulo(2)
  elseif lMenu == 2 then ativarSuperPulo(4)
  elseif lMenu == 3 then ativarSuperPulo(8)
  elseif lMenu == 4 then ativarSuperPulo(1)
  elseif lMenu == 5 then menuSpeed() end
end

function ativarspeedagachado(velocidadespeed)
   -- Validação do input
   if type(velocidadespeed) ~= "number" or velocidadespeed <= 0 then
       gg.toast("⚠️ Kecepatan Tidak Valid! Gunakan Angka Positif.")
       return false
   end

   -- Se já existe cache, apenas atualiza
   if speedAgachadoCache.addresses then
       local edits = {}
       for i, addr in ipairs(speedAgachadoCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = velocidadespeed
           }
       end
       gg.setValues(edits)
       speedAgachadoCache.lastSpeed = velocidadespeed
       gg.toast(string.format("🦇 KECEPATAN JONGKOK: %.1fx ", velocidadespeed))
       gg.clearResults()
       return true
   end

   -- Busca inicial
   gg.clearResults()
   gg.searchNumber(speedAgachadoCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("❌ NILAI DASAR TIDAK DITEMUKAN!")
       return false
   end

   -- Armazena endereços (offset -72)
   speedAgachadoCache.addresses = {}
   for i, result in ipairs(results) do
       speedAgachadoCache.addresses[i] = result.address - 72
   end

   -- Aplica as edições
   local edits = {}
   for i, addr in ipairs(speedAgachadoCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = velocidadespeed
       }
   end
   gg.setValues(edits)
   speedAgachadoCache.lastSpeed = velocidadespeed
   
   gg.toast(string.format("🦇 KECEPATAN JONGKOK: %.1fx DIAKTIFKAN", velocidadespeed))
   gg.clearResults()
   return true
end

-- Reset de cache
function resetSpeedAgachadoCache()
   speedAgachadoCache.addresses = nil
   gg.toast("🔄 RESET CACHE KECEPATAN JONGKOK")
end

function esticada()
esticadat = gg.choice({"✔️ MENGAKTIFKAN ✔️", "❌ MENONAKTIFKAN ❌", "KEMBALI"}, nil, versao)

   if esticadat == 1 then esticadaon() end
   if esticadat == 2 then esticadaoff() end
   if esticadat == 3 then loop(menupremium,"prin") end
end

function esticadaon()
   gg.searchNumber("70", gg.TYPE_FLOAT)
   gg.getResults(99999)
   gg.editAll("120", gg.TYPE_FLOAT)
   gg.toast("kanvas yang diregangkan ON")
   gg.clearResults()
end

function esticadaoff()
   gg.searchNumber("120", gg.TYPE_FLOAT)
   gg.getResults(99999)
   gg.editAll("70", gg.TYPE_FLOAT)
   gg.toast("kanvas yang diregangkan OFF")
   gg.clearResults()
end

-- ==========================================
-- FUNÇÕES DE BUSCA
-- ==========================================
function buscarBasePlayer()
    if addrX and addrY and addrZ then return true end
    gg.clearResults()
    gg.searchNumber(tostring(BASE), gg.TYPE_QWORD)
    local r = gg.getResults(1000)
    local check1, check2 = {}, {}
    for i, v in ipairs(r) do
        check1[i] = {address = v.address - 208, flags = gg.TYPE_QWORD}
        check2[i] = {address = v.address - 212, flags = gg.TYPE_QWORD}
    end
    check1 = gg.getValues(check1)
    check2 = gg.getValues(check2)
    for i = 1, #check1 do
        if check1[i].value == -4411463732228264604 and check2[i].value == -4250292608395772511 then
            local base = check1[i].address - 108
            addrZ = base + OZ
            addrX = base + OX
            addrY = base + OY
            gg.toast("✅ Pemain dimuat")
            return true
        end
    end
    gg.toast("❌ Pemain tidak ditemukan")
    return false
end

function carregarBasePlayer()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.toast("🔄 Carregando base do player...")
    gg.searchNumber(tostring(BASE), gg.TYPE_QWORD)
    local r = gg.getResults(1000)
    if #r == 0 then 
        gg.toast("❌ Base tidak ditemukan") 
        return false 
    end
    local check1, check2 = {}, {}
    for i, v in ipairs(r) do
        check1[i] = {address = v.address - 208, flags = gg.TYPE_QWORD}
        check2[i] = {address = v.address - 212, flags = gg.TYPE_QWORD}
    end
    check1 = gg.getValues(check1)
    check2 = gg.getValues(check2)
    for i = 1, #check1 do
        if check1[i].value == -4411463732228264604 and check2[i].value == -4250292608395772511 then
            local base = check1[i].address - 108
            addrZ = base + OZ
            addrX = base + OX
            addrY = base + OY
            gg.toast("✅ Base Pemain Berhasil Dimuat!")
            gg.toast("📍 X: " .. addrX .. " | Y: " .. addrY .. " | Z: " .. addrZ)
            return true
        end
    end
    gg.toast("❌ Gagal Memuat Base Pemain.")
    return false
end

function TP(x, y, z)
    if not addrX or not addrY or not addrZ then
        if not buscarBasePlayer() then return end
    end
    gg.setValues({
        {address = addrX, value = x, flags = gg.TYPE_FLOAT},
        {address = addrY, value = y, flags = gg.TYPE_FLOAT},
        {address = addrZ, value = z, flags = gg.TYPE_FLOAT}
    })
    gg.toast("✅ TELEPORTASI!")
end

function obterDeslocamento()
    local p1 = gg.getValues({
        {address = addrX, flags = gg.TYPE_FLOAT}, 
        {address = addrY, flags = gg.TYPE_FLOAT}, 
        {address = addrZ, flags = gg.TYPE_FLOAT}
    })
    
    gg.sleep(50)
    
    local p2 = gg.getValues({
        {address = addrX, flags = gg.TYPE_FLOAT}, 
        {address = addrY, flags = gg.TYPE_FLOAT}, 
        {address = addrZ, flags = gg.TYPE_FLOAT}
    })
    
    local dx = p2[1].value - p1[1].value
    local dy = p2[2].value - p1[2].value
    local dz = p2[3].value - p1[3].value
    local distancia = math.sqrt(dx*dx + dy*dy + dz*dz)
    
    return distancia, dx, dy, dz, p2
end

-- ==========================================
-- NOVO MOD: CAMINHAR 2M / ATRAVESSAR ILIMITADO
-- ==========================================
function modoToggleSpamIlimitado()
    if not addrX and not buscarBasePlayer() then return end
    gg.toast("🔄 FUNGSI DIAKTIFKAN! GERAKKAN KARAKTERMU.. (BUKA GG UNTUK MENJEDA))")
    gg.setVisible(false)
    
    while true do
        if gg.isVisible(true) then
            gg.toast("🛑 PAUSE!")
            break
        end
        
        local dist, dx, dy, dz, p2 = obterDeslocamento()
        if dist > 0.01 then
            local metros = 4.0 
            local novoX = p2[1].value + (dx / dist) * metros
            local novoY = p2[2].value + (dy / dist) * metros
            local novoZ = p2[3].value + (dz / dist) * metros
            
            gg.setValues({
                {address = addrX, value = novoX, flags = gg.TYPE_FLOAT},
                {address = addrY, value = novoY, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = novoZ, flags = gg.TYPE_FLOAT}
            })
        end
        gg.sleep(40)
    end
end
-- ==========================================
-- EDIT MANUAL KOORDINAT PLAYER + SAVE ADDRESS
-- ==========================================

function getCurrentCoordinates()
    if not addrX or not addrY or not addrZ then
        if not buscarBasePlayer() then
            gg.toast("❌ BASE PLAYER TIDAK DITEMUKAN!")
            return nil
        end
    end

    local coords = gg.getValues({
        {address = addrX, flags = gg.TYPE_FLOAT},
        {address = addrY, flags = gg.TYPE_FLOAT},
        {address = addrZ, flags = gg.TYPE_FLOAT}
    })

    return {
        x = coords[1].value,
        y = coords[2].value,
        z = coords[3].value,
        addrX = addrX,
        addrY = addrY,
        addrZ = addrZ
    }
end

function editManualCoordinates()
    local pos = getCurrentCoordinates()
    if not pos then return end

    local input = gg.prompt({
        "📍 X KORDINAT",
        "📍 Y KORDINAT",
        "📍 Z KORDINAT"
    }, {
        string.format("%.3f", pos.x),
        string.format("%.3f", pos.y),
        string.format("%.3f", pos.z)
    }, {"number", "number", "number"})

    if not input then return end

    gg.setValues({
        {address = pos.addrX, value = tonumber(input[1]), flags = gg.TYPE_FLOAT},
        {address = pos.addrY, value = tonumber(input[2]), flags = gg.TYPE_FLOAT},
        {address = pos.addrZ, value = tonumber(input[3]), flags = gg.TYPE_FLOAT}
    })

    gg.toast("✅ KOORDINAT BERHASIL DIUBAH!\nX: " .. input[1] .. "\nY: " .. input[2] .. "\nZ: " .. input[3])
end

function saveAndCopyPlayerAddress()
    local pos = getCurrentCoordinates()
    if not pos then return end

    local info = "=== PLAYER COORDINATE ===\n" ..
                 "X Address : " .. string.format("0x%X", pos.addrX) .. "\n" ..
                 "Y Address : " .. string.format("0x%X", pos.addrY) .. "\n" ..
                 "Z Address : " .. string.format("0x%X", pos.addrZ) .. "\n\n" ..
                 "Current Pos:\n" ..
                 "X = " .. pos.x .. "\n" ..
                 "Y = " .. pos.y .. "\n" ..
                 "Z = " .. pos.z

    gg.copyText(info)
    gg.alert("✅ ALAMAT KOORDINAT PLAYER DISALIN KE CLIPBOARD!\n\n" .. info)
end

-- ==========================================
-- SISTEM SAVE POSISI PERMANEN + EXPORT / IMPORT (FIXED)
-- ==========================================

local savedPositions = {}
local SAVED_FILE = "/storage/emulated/0/kingtirr_savedpos.txt"
local EXPORT_FILE = "/storage/emulated/0/kingtirr_savedpos_export.txt"

-- Fungsi untuk menyimpan tabel ke file (format Lua)
-- ==========================================
-- SAVE & LOAD PERMANEN (SUDAH DIBENARKAN)
-- ==========================================

function saveSavedPositions()
    local file = io.open(SAVED_FILE, "w")
    if file then
        file:write("return {\n")
        for i, pos in ipairs(savedPositions) do
            local x = pos.x or 0
            local y = pos.y or 0
            local z = pos.z or 0
            local safeName = pos.name:gsub('"', '\\"'):gsub('\\', '\\\\')
            file:write(string.format('    {name = "%s", x = %.6f, y = %.6f, z = %.6f},\n', 
                safeName, x, y, z))
        end
        file:write("}\n")
        file:close()
        gg.toast("💾 Data tersimpan permanen (" .. #savedPositions .. " posisi)")
    end
end

function importSavedPositions()
    local file = io.open(EXPORT_FILE, "r")
    if not file then
        gg.alert("❌ File export tidak ditemukan di:\n" .. EXPORT_FILE .. "\n\nExport dulu sebelum import.")
        return
    end

    local content = file:read("*a")
    file:close()

    local imported = 0
    -- Parsing yang lebih kuat
    for line in content:gmatch("[^\r\n]+") do
        local num, name = line:match("^(%d+)%.%s*(.+)")
        if num and name then
            -- Cari baris X, Y, Z setelahnya
            local x = content:match(name .. ".-X%s*=%s*([%d.-]+)")
            local y = content:match(name .. ".-Y%s*=%s*([%d.-]+)")
            local z = content:match(name .. ".-Z%s*=%s*([%d.-]+)")
            
            if x and y and z then
                table.insert(savedPositions, {
                    name = name:gsub("^%s*(.-)%s*$", "%1"),
                    x = tonumber(x),
                    y = tonumber(y),
                    z = tonumber(z)
                })
                imported = imported + 1
            end
        end
    end

    if imported > 0 then
        saveSavedPositions()
        gg.alert("✅ IMPORT BERHASIL!\n" .. imported .. " posisi berhasil ditambahkan")
        gg.toast("Total posisi sekarang: " .. #savedPositions)
    else
        gg.alert("❌ Tidak ada data yang bisa diimport\n\nPastikan file export benar.")
    end
end

function loadSavedPositions()
    local file = io.open(SAVED_FILE, "r")
    if file then
        local content = file:read("*a")
        file:close()
        local success, data = pcall(load(content))
        if success and type(data) == "table" then
            savedPositions = data
            gg.toast("✅ " .. #savedPositions .. " lokasi berhasil dimuat")
        else
            gg.toast("⚠️ Gagal memuat file save")
        end
    end
end

function exportSavedPositions()
    if #savedPositions == 0 then
        gg.alert("❌ Tidak ada posisi untuk diekspor!\n\nSimpan posisi dulu.")
        return
    end

    local file = io.open(EXPORT_FILE, "w")
    if file then
        file:write("=== KING TIRRZ SAVED POSITIONS EXPORT ===\n")
        file:write("Tanggal: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n")
        file:write("Total: " .. #savedPositions .. " posisi\n\n")
        
        for i, pos in ipairs(savedPositions) do
            file:write(i .. ". " .. pos.name .. "\n")
            file:write("   X = " .. string.format("%.4f", pos.x) .. "\n")
            file:write("   Y = " .. string.format("%.4f", pos.y) .. "\n")
            file:write("   Z = " .. string.format("%.4f", pos.z) .. "\n\n")
        end
        file:close()
        
        gg.alert("✅ EXPORT BERHASIL!\n\nFile disimpan di:\n" .. EXPORT_FILE)
        gg.copyText(EXPORT_FILE)
        gg.toast("📋 Lokasi file sudah dicopy ke clipboard")
    else
        gg.alert("❌ Gagal membuat file export")
    end
end

-- ==========================================
-- SISTEM SAVE POSISI LENGKAP
-- ==========================================

function saveCurrentPosition()
    local pos = getCurrentCoordinates()
    if not pos then return end

    local input = gg.prompt({"💾 Masukkan Nama Lokasi"}, {"Lokasi " .. (#savedPositions + 1)}, {"text"})
    if not input or not input[1] then return end

    table.insert(savedPositions, {
        name = input[1],
        x = pos.x,
        y = pos.y,
        z = pos.z
    })

    saveSavedPositions()  -- Simpan permanen
    gg.toast("✅ POSISI DISIMPAN!\n📍 " .. input[1])
end

function teleportToSavedPosition()
    if #savedPositions == 0 then
        gg.alert("❌ Belum ada posisi tersimpan!")
        return
    end

    local list = {}
    for i, pos in ipairs(savedPositions) do
        table.insert(list, pos.name .. " (X:" .. string.format("%.2f", pos.x) .. ")")
    end
    table.insert(list, "◀️ KEMBALI")

    local choice = gg.choice(list, nil, "📍 TELEPORT KE POSISI TERSIMPAN")
    if not choice or choice == #list then return end

    local selected = savedPositions[choice]

    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ Base player tidak ditemukan!")
        return
    end

    gg.setValues({
        {address = addrX, value = selected.x, flags = gg.TYPE_FLOAT},
        {address = addrY, value = selected.y, flags = gg.TYPE_FLOAT},
        {address = addrZ, value = selected.z, flags = gg.TYPE_FLOAT}
    })

    gg.toast("🚀 TELEPORT KE: " .. selected.name)
end

function clearSavedPositions()
    if gg.alert("🗑️ Hapus SEMUA posisi tersimpan?", "YA", "BATAL") == 1 then
        savedPositions = {}
        saveSavedPositions()
        gg.toast("🗑️ Semua posisi telah dihapus")
    end
end


-- ==========================================
-- FUNGSI TELEPORT GPS
-- ==========================================

function teleportToPoint(point)
    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ Base player tidak ditemukan!")
        return false
    end

    gg.setValues({
        {address = addrX, value = point.x, flags = gg.TYPE_FLOAT},
        {address = addrY, value = point.y, flags = gg.TYPE_FLOAT},
        {address = addrZ, value = point.z, flags = gg.TYPE_FLOAT}
    })

    gg.toast("✅ TELEPORT KE: " .. point.name)
    gg.sleep(100)

    -- Anti void kecil
    local yCheck = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
    if yCheck[1].value < 0 or yCheck[1].value > 3000 then
        gg.toast("⚠️ Anti-void aktif...")
        gg.setValues({{address = addrY, value = point.y + 5, flags = gg.TYPE_FLOAT}})
    end
    return true
end

function menuTeleportGPS()
    local menuList = {}
    for i, p in ipairs(teleportPoints) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT GPS - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(teleportPoints[choice])
end

function TpUmum()
    local menuList = {}
    for i, p in ipairs(umum) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT UMUM - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(umum[choice])
end

function TpFraksi()
    local menuList = {}
    for i, p in ipairs(fraksi) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT FRAKSI - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(fraksi[choice])
end

function TpToko()
    local menuList = {}
    for i, p in ipairs(toko) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT TOKO - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(toko[choice])
end

function TpParkiran()
    local menuList = {}
    for i, p in ipairs(parkiran) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT PARKIRAN - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(parkiran[choice])
end

function TpBank()
    local menuList = {}
    for i, p in ipairs(bank) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT KE BANK - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(bank[choice])
end

function TpSc()
    local menuList = {}
    for i, p in ipairs(scooter) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT SEWA SCOOTER - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(scooter[choice])
end

function JobKerja()
    local menuList = {}
    for i, p in ipairs(jobkerja) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT JOB KERJA - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(jobkerja[choice])
end

function TpLadang()
    local menuList = {}
    for i, p in ipairs(ladang) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT LADANG PERTANIAN - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(ladang[choice])
end

function TpPenjara()
    local menuList = {}
    for i, p in ipairs(penjara) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT KE PENJARA - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(penjara[choice])
end

function TpKontainer()
    local menuList = {}
    for i, p in ipairs(kontainer) do
        table.insert(menuList, p.name)
    end
    table.insert(menuList, "◀️ KEMBALI")

    local choice = gg.choice(menuList, nil, "🧭 TELEPORT LELANG KONTAINER - KING TIRRZ v1.3")
    if not choice or choice == #menuList then return end
    
    if choice == #menuList then 
        menuTeleportInstan()  -- KEMBALI
        return
    end

    teleportToPoint(kontainer[choice])
end


-- ==========================================
-- FUNÇÃO ANTI-VOID
-- ==========================================

function antiVoid()
    if not addrY then
        return false
    end
    
    local altura = gg.getValues({{address = addrY, flags = gg.TYPE_FLOAT}})
    
    if altura and altura[1] and altura[1].value then
        if altura[1].value < 900 or altura[1].value > 2000 then
            gg.toast("💀 DETEKSI KEKOSONGAN! Berteleportasi Ke Tempat Yang Aman...")
            gg.setValues({
                {address = addrX, value = pontoSeguro.x, flags = gg.TYPE_FLOAT},
                {address = addrY, value = pontoSeguro.y, flags = gg.TYPE_FLOAT},
                {address = addrZ, value = pontoSeguro.z, flags = gg.TYPE_FLOAT}
            })
            gg.sleep(100)
            return true
        end
    end
    return false
end

-- ==========================================
-- FUNÇÃO DE TELEPORTE PARA PONTO SEGURO (TERRA)
-- ==========================================

function teleportToSafePoint()
    if not addrZ and not buscarBasePlayer() then
        gg.toast("❌ Teleportasi tidak mungkin dilakukan.")
        return false
    end
    
    gg.setValues({
        {address = addrX, value = pontoSeguro.x, flags = gg.TYPE_FLOAT},
        {address = addrY, value = pontoSeguro.y, flags = gg.TYPE_FLOAT},
        {address = addrZ, value = pontoSeguro.z, flags = gg.TYPE_FLOAT}
    })
    
    gg.toast("🏔️ TELEPORT PARA " .. pontoSeguro.nome)
    return true
end


-- ==========================================
-- MOSTRAR Criadores
-- ==========================================

function mostrarCriadores()
    local tempo = os.date("*t")
    local waktuSekarang = string.format("%02d/%02d/%04d - %02d:%02d:%02d", 
        tempo.day, tempo.month, tempo.year, tempo.hour, tempo.min, tempo.sec)
    local msg = linha_divisoria .. "\n"
    for i, criador in ipairs(Criadores) do
        if i == 1 then
            msg = msg .. "🚩 " .. criador .. " 🚩\n"
        elseif i == #Criadores then
            msg = msg .. "🇮🇩 " .. criador .. " 🇮🇩\n"
        else
            msg = msg .. "🔥 " .. criador .. " 🔥\n"
        end
    end
    msg = msg .. linha_divisoria .. "\n Rio Rise V1.3"
    
    gg.alert(msg)
    
    local toastMsg = ""
    for i, criador in ipairs(Criadores) do
        toastMsg = toastMsg .. criador
        if i < #Criadores then
            toastMsg = toastMsg .. " | "
        end
    end
    gg.toast("👾 " .. toastMsg .. " | Rio Rise V1.3")
end

---------------------------------------------------------
-- TELA DE DESPEDIDA
---------------------------------------------------------
function sair()
    gg.alert("═════════════════════════\n           👋 SAMPAI JUMPA LAGI! 👋\n\n      Pencipta: KING TIRR👑\n      Pemilik: KING TIRR👑\n\n   \n═════════════════════════")
    gg.toast("👋 Script ditutup...")
    gg.sleep(500)
    os.exit()
end

-- ==========================================
-- MENU PRINCIPAL
-- ==========================================

function menu_principal()
    local tempo = os.date("*t")
    local waktuSekarang = string.format("%02d/%02d/%04d - %02d:%02d:%02d", 
        tempo.day, tempo.month, tempo.year, tempo.hour, tempo.min, tempo.sec)

    local mainMenu = gg.choice({
        "👽 MENU PEMAIN",
        "🌍 TELEPORT",
        "💸 MENU AUTO FARM",
        "🏎️SPEED KENDARAAN",
        "👨‍💻 CREATOR",
        "❌ KELUAR"
    }, nil, "🔥 " .. Criadores[1] .. " 🔥 | Rio Rise V1.3\n\n" ..
             "🕒 Sekarang : " .. waktuSekarang)

        if mainMenu == 1 then
        menuPlayerGZ()
        elseif mainMenu == 2 then
        menuTeleportInstan()
        elseif mainMenu == 3 then
        menuFarm()
        elseif mainMenu == 4 then
        Menu_vehicle()
        elseif mainMenu == 5 then
        mostrarCriadores()
        elseif mainMenu == 6 then
        sair()
    end
end

function menuPlayerGZ()
    local h = gg.choice({
        "🧬 GOD MODE",
        "⚡ MENU SUPER",
        "💎 MENU PREMIUM",
        "◀️ KEMBALI"
    }, nil, "👽 MENU PEMAIN")

    if h == 1 then
        menuImortalidade()
    elseif h == 2 then
        menuSpeed()
    elseif h == 3 then
        MenuPremium2()
    elseif h == 4 then
        menu_principal()
    end
end

function menuTeleportInstan()
    local instan = gg.choice({
        "⚡ TP INSTAN MAP",
        "🌍 TP LOKASI TETAP",
        "⚙️ TELEPORT MANUAL",
        "◀️ KEMBALI"
    }, nil, "🔥 TELEPORT INSTAN")

    if instan == 1 then
        menuTeleporte()
    elseif instan == 2 then
        teleport_1()
    elseif instan == 3 then
        menuManual()
    elseif instan == 4 then
        menu_principal()
    end
end

function teleport_1()
    local teleport = gg.choice({
        "🧭 TELEPORT KOTA",
        "🎯 TELEPORT UMUM",
        "🗡️ FRAKSI",
        "📦 JOB KERJA",
        "🅿️ PARKIRAN",
        "🏦 BANK",
        "🛒 TOKO",
        "🛵 TEMPAT SEWA SCOOTER",
        "🪏 LADANG PERTERNAKAN",
        "🚧 PENJARA",
        "🪝 LELANG KONTAINER",     -- ← DIBENARKAN
        "👨‍💻 CREATOR",
        "◀️ KEMBALI"
    }, nil, "🔥 " .. Criadores[1] .. " 🔥 | Rio Rise V1.3")

    if teleport == 1 then
        menuTeleportGPS()
    elseif teleport == 2 then
        TpUmum()
    elseif teleport == 3 then
        TpFraksi()
    elseif teleport == 4 then
        JobKerja()
    elseif teleport == 5 then
        TpParkiran()
    elseif teleport == 6 then
        TpBank()
    elseif teleport == 7 then
        TpToko()
    elseif teleport == 8 then
        TpSc()
    elseif teleport == 9 then
        TpLadang()
    elseif teleport == 10 then
        TpPenjara()
    elseif teleport == 11 then
        TpKontainer()
    elseif teleport == 12 then
        mostrarCriadores()
    elseif teleport == 13 then
        menu_principal()
    end
end


function menuManual()
    local manual = gg.choice({
        "📍 EDIT MANUAL XYZ",
        "📄 COPY XYZ PLAYER",
        "💾 SAVE POSISI SAAT INI",
        "🔙 TELEPORT KE SAVED POSISI",
        "🗑️ HAPUS SEMUA SAVED",
        "📤 EXPORT SAVED POSISI",
        "📥 IMPORT SAVED POSISI",
        "👨‍💻 CREATOR",
        "◀️ KEMBALI"
    }, nil, "🔥 TELEPORT MANUAL - KING TIRRZ v1.3")

    if manual == 1 then
        editManualCoordinates()
    elseif manual == 2 then
        saveAndCopyPlayerAddress()
    elseif manual == 3 then
        saveCurrentPosition()
    elseif manual == 4 then
        teleportToSavedPosition()
    elseif manual == 5 then
        clearSavedPositions()
    elseif manual == 6 then
        exportSavedPositions()
    elseif manual == 7 then
        importSavedPositions()
    elseif manual == 8 then
        mostrarCriadores()
    elseif manual == 9 then
        menu_principal()
    end
end
-- ==========================================
-- FUNGSI PLAYER
-- ==========================================

vida_local = nil
colete_local = nil
vida_endereco = nil
colete_endereco = nil

-- ====================== SET HEALTH ======================
function setHealth(value, freeze)
    if value == nil then value = 999999 end
    if freeze == nil then freeze = true end
    
    if vida_local == nil then
        local vida_inf = {{99999.9921875, 0}}
        vida_local = SearchGet("Ca", "f", vida_inf)
    end
    
    if vida_local and #vida_local > 0 then
        local vida_edit = {{value, -0x54}}
        editGet(vida_local, vida_edit, "f")
        vida_endereco = vida_local[1].address + 0x54  -- pastikan alamat benar
        
        local item = {{
            address = vida_endereco,
            flags = gg.TYPE_FLOAT,
            value = value,
            freeze = freeze
        }}
        
        gg.setValues({item[1]})
        
        if freeze then
            gg.addListItems(item)
            gg.toast("❤️ DARAH TAK TERBATAS: " .. value .. " [FREEZE]")
        else
            gg.removeListItems(item)
            gg.toast("❤️ DARAH DIUBAH: " .. value)
        end
    else
        gg.toast("❌ GAGAL MENCARI ALAMAT DARAH")
        vida_local = nil  -- reset untuk percobaan ulang
    end
end

-- ====================== SET ARMOR ======================
function setArmor(value, freeze)
    if value == nil then value = 999999 end
    if freeze == nil then freeze = true end
    
    if colete_local == nil then
        local colete_inf = {{99999.9921875, 0}}
        colete_local = SearchGet("Ca", "f", colete_inf)
    end
    
    if colete_local and #colete_local > 0 then
        local colete_edit = {{value, -0x4C}}
        editGet(colete_local, colete_edit, "f")
        colete_endereco = colete_local[1].address + 0x4C
        
        local item = {{
            address = colete_endereco,
            flags = gg.TYPE_FLOAT,
            value = value,
            freeze = freeze
        }}
        
        gg.setValues({item[1]})
        
        if freeze then
            gg.addListItems(item)
            gg.toast("🛡️ ROMPI TAK TERBATAS: " .. value .. " [FREEZE]")
        else
            gg.removeListItems(item)
            gg.toast("🛡️ ROMPI DIUBAH: " .. value)
        end
    else
        gg.toast("❌ GAGAL MENCARI ALAMAT ROMPI")
        colete_local = nil
    end
end

-- ====================== MENU (sudah oke, sedikit diperbaiki) ======================
function menuImortalidade()
    local m = gg.choice({
        "🧬 DARAH TAK TERBATAS + FREEZE",
        "🛡️ ROMPI TAK TERBATAS + FREEZE",
        "❤️ Darah 80",
        "❤️ Darah 100",
        "❤️ Darah 200",
        "🛡️ Rompi 80",
        "🛡️ Rompi 100",
        "🛡️ Rompi 200",
        "⚙️ Custom Value",
        "◀️ KEMBALI"
    }, nil, "🔥 GOD MODE - KING TIRRZ")

    if m == 1 then
        setHealth(36272829202481, true)
    elseif m == 2 then
        setArmor(36272829202481, true)
    elseif m == 3 then
        setHealth(80, false)
    elseif m == 4 then
        setHealth(100, false)
    elseif m == 5 then
        setHealth(200, false)
    elseif m == 6 then
        setArmor(80, false)
    elseif m == 7 then
        setArmor(100, false)
    elseif m == 8 then
        setArmor(200, false)
    elseif m == 9 then
        local input = gg.prompt({"❤ Masukkan Nilai Darah / Rompi"}, {"999999"}, {"number"})
        if input and input[1] then
            local val = tonumber(input[1])
            if val then
                setHealth(val, false)
                setArmor(val, false)
            end
        end
    elseif m == 10 then 
        menu_principal() 
    end
end

-- ================== MENU AUTO FARM ==================

gg.setVisible(false)
gg.toast("🔍 MEMULAI PRELOAD CEPAT...")

-- ==========================================
-- PRELOAD CEPAT & OPTIMAL
-- ==========================================

-- 1. Preload Player Base (Teleport)
local baseLoaded = false
for attempt = 1, 3 do
    gg.toast("🔄 Mencari Base Player... (" .. attempt .. "/3)")
    if buscarBasePlayer() then
        baseLoaded = true
        break
    end
    gg.sleep(50)
end

if not baseLoaded then
    gg.alert("⚠️ Base Player tidak ditemukan!\nFitur Teleport mungkin lambat.")
end

-- 2. Preload Kecepatan Lari (Lari Kencang)
gg.toast("🏃 Preload Lari Kencang...")
if speedWalkCache == nil then
    speedWalkCache = { addresses = nil, lastTarget = "..." } -- ganti dengan nilai target yang benar
end
if speedWalkCache.addresses == nil then
    gg.clearResults()
    gg.searchNumber(speedWalkCache.lastTarget, gg.TYPE_FLOAT)
    local results = gg.getResults(1500)
    if #results > 0 then
        speedWalkCache.addresses = {}
        for i, res in ipairs(results) do
            speedWalkCache.addresses[i] = res.address - 36
        end
    end
    gg.clearResults()
end

gg.toast("✅ PRELOAD SELESAI - Fitur siap!")
gg.sleep(400)

-- ==========================================
-- LOOP PRINCIPAL
-- ==========================================

gg.toast("✅ Script siap digunakan!")
gg.sleep(300)

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        
        local success, err = pcall(menu_principal)
        
        if not success then
            if tostring(err):find("os%.exit") or tostring(err):find("exit") then
                return
            else
                gg.alert("❌ Terjadi kesalahan:\n" .. tostring(err))
            end
        end
    end
    gg.sleep(100)
end