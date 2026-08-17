-- =============================================
-- KING TIRRZ PREMIUM v3.7 - FREE + PREMIUM
-- =============================================

local Accounts = {
    ["FREE1"] = { password = "FREETRIAL3DAY", expired = "2026/06/27 06:00:59", type = "free" },
    ["FREE2"] = { password = "CUKI", expired = "2026/06/30 23:59:59", type = "free" },
    ["PREMIUM1"] = { password = "SOBATSEKONS", expired = "2026/06/27 23:59:59", type = "premium" },
    ["PRIBADI"] = { password = "TIRR18", expired = "", type = "premium" },
    ["ZIZZ"] = { password = "ZIZZ", expired = "2026/06/30 23:59:59", type = "premium" },
    ["ENZO"] = { password = "ENZOMUR", expired = "2026/07/01 23:59:59", type = "premium" },
    ["VERMON"] = { password = "VERMONBLACK", expired = "2026/07/04 23:59:59", type = "premium" },
    ["LEO134"] = { password = "LEO134", expired = "2026/06/28 23:59:59", type = "premium" },
    ["ELL"] = { password = "LOPEZZZ", expired = "2026/07/01 23:59:59", type = "premium" },
    ["DJAROT"] = { password = "DJAROTEXP", expired = "2026/07/06 23:59:59", type = "premium" },
    ["JAMESROBERT"] = { password = "JAMESROB", expired = "2026/07/01 23:59:59", type = "premium" },
    ["RESBOBBB"] = { password = "RESBOBBB", expired = "2026/06/28 23:59:59", type = "premium" },
    ["KURNIA"] = { password = "KURNIA", expired = "2027/06/30 06:00:59", type = "premium" },
    ["PENPEN"] = { password = "PENPEN", expired = "2027/06/30 06:00:59", type = "premium" },
    ["TIRRMODZZZ"] = { password = "TIRRMODZZZ", expired = "2027/06/29 23:59:59", type = "premium" },
    ["FAM"] = { password = "ROXIONEXUS", expired = "", type = "premium" },
    ["KINAN"] = { password = "KINAN", expired = "2026/06/28 14:59:59", type = "premium" },
}

local Version = "3.7"
local SaveFile = gg.EXT_STORAGE .. "/KingTirrz_Login.dat"
local BackupFile = gg.EXT_STORAGE .. "/KingTirrz_Backup.dat"
local HistoryFile = gg.EXT_STORAGE .. "/KingTirrz_History.log"

local antiDetect = true

-- =============================================
-- HELPER FUNCTIONS
-- =============================================
function applyAntiDetect()
    if not antiDetect then return end
    gg.setVisible(false)
    gg.toast("🛡️ Anti-Detect Aktif...")
    gg.sleep(math.random(300, 700))
end

function getHWID()
    local pkg = gg.PACKAGE or "unknown"
    local raw = pkg .. "|" .. tostring(os.time() // 86400)
    local hash = 2166136261
    for i = 1, #raw do
        hash = (hash * 16777619) % 4294967295
        hash = (hash + string.byte(raw, i)) % 4294967295
    end
    return string.format("%08X", hash)
end

function getDeviceID()
    return "DEV-" .. getHWID()
end

function getScriptURL(accountType)
    if accountType == "free" then
        return "https://myadmin.mmmods.com/uploadsscript/GRATIS97739061.lua"
    else
        return "https://myadmin.mmmods.com/uploadsscript/PREMIUMM77437499.lua"
    end
end

function checkExpired(expiredTime)
    if not expiredTime or expiredTime == "" then return true end
    local y,m,d,h,min,s = string.match(expiredTime, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)")
    if not y then return true end
    local exp = os.time{year=tonumber(y), month=tonumber(m), day=tonumber(d), hour=tonumber(h), min=tonumber(min), sec=tonumber(s)}
    return os.time() <= exp
end

function validateAccount(user, password)
    local acc = Accounts[user]
    if not acc then return false, "Akun tidak terdaftar", nil end
    if not (acc.password == password) then return false, "Password salah", nil end
    if not checkExpired(acc.expired) then return false, "Akun sudah expired", nil end
    return true, "Valid", acc.type
end

function saveToHistory(user, status)
    local file = io.open(HistoryFile, "a")
    if file then
        file:write(os.date("%Y-%m-%d %H:%M:%S") .. " | " .. user .. " | " .. status .. "\n")
        file:close()
    end
end

function showLoginHistory()
    local file = io.open(HistoryFile, "r")
    if not file then return gg.alert("Belum ada riwayat login") end
    local content = file:read("*a")
    file:close()
    gg.alert("📜 LOGIN HISTORY\n\n" .. content)
end

function showAccountInfo()
    local saved = loadSavedAccounts()
    local info = "🌟 KING TIRRZ v" .. Version .. "\n\n"
    info = info .. "📍 Device ID : " .. getDeviceID() .. "\n"
    info = info .. "🔑 HWID       : " .. getHWID() .. "\n"
    info = info .. "📊 Akun Tersimpan : " .. #saved .. "\n"
    info = info .. "🛡️ Anti-Detect : " .. (antiDetect and "ON" or "OFF")
    gg.alert(info)
end

function autoBackup()
    local file = io.open(SaveFile, "r")
    if not file then return end
    local content = file:read("*a")
    file:close()
    local backup = io.open(BackupFile, "w")
    if backup then
        backup:write("-- BACKUP " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n" .. content)
        backup:close()
    end
end

function loadSavedAccounts()
    local accounts = {}
    local file = io.open(SaveFile, "r")
    if not file then return accounts end
    for line in file:lines() do
        if #line > 5 then
            local u,p,d,h,t = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|(%d+)")
            if u and p then
                table.insert(accounts, {user=u, pass=p, device=d, hwid=h, time=tonumber(t)})
            end
        end
    end
    file:close()
    return accounts
end

function saveLogin(username, password)
    local file = io.open(SaveFile, "a")
    if file then
        file:write(username .. "|" .. password .. "|" .. getDeviceID() .. "|" .. getHWID() .. "|" .. os.time() .. "\n")
        file:close()
        gg.toast("💾 Akun berhasil disimpan")
        autoBackup()
        saveToHistory(username, "Login Sukses")
        return true
    end
    return false
end

function deleteSpecificAccount()
    local saved = loadSavedAccounts()
    if #saved == 0 then return gg.alert("Tidak ada akun!") end

    local list = {}
    for i, acc in ipairs(saved) do
        table.insert(list, i .. ". " .. acc.user)
    end

    local choice = gg.choice(list, nil, "Pilih akun yang ingin dihapus")
    if not choice then return end

    local konfirmasi = gg.alert("Yakin hapus akun:\n" .. saved[choice].user, "Batal", "Ya Hapus")
    if not (konfirmasi == 2) then return gg.toast("Dibatalkan") end

    local file = io.open(SaveFile, "w")
    for i, acc in ipairs(saved) do
        if not (i == choice) then
            file:write(acc.user .. "|" .. acc.pass .. "|" .. acc.device .. "|" .. acc.hwid .. "|" .. acc.time .. "\n")
        end
    end
    file:close()
    autoBackup()
    gg.toast("🗑️ Akun berhasil dihapus")
end

-- =============================================
-- MAIN MENU (SUDAH DIMODIFIKASI)
-- =============================================
gg.setVisible(false)
applyAntiDetect()

gg.alert("🌟 KING TIRRZ v" .. Version)

while true do
    local saved = loadSavedAccounts()
    local hasSaved = #saved > 0

    local menu = gg.choice({
        hasSaved and "🔑 Login Saved" or nil,
        "🔑 Login Password Only",
        "📋 Akun Management",
        "🛠️ Pengaturan",
        "❌ Keluar"
    }, nil, "👑 KING TIRRZ v" .. Version)

    if not menu then return end
    if menu == 5 then return end

    if menu == 1 and hasSaved then
        -- Login Saved
        applyAntiDetect()
        local cd = getDeviceID()
        local ch = getHWID()
        local validList = {}
        local display = {}

        for _, acc in ipairs(saved) do
            if acc.device == cd and acc.hwid == ch and (os.time() - acc.time) < 86400 then
                local ok, _, typ = validateAccount(acc.user, acc.pass)
                table.insert(validList, {user=acc.user, pass=acc.pass, type=typ})
                table.insert(display, (ok and "✅ " or "❌ ") .. acc.user)
            end
        end

        if #display == 0 then
            gg.alert("❌ Tidak ada akun valid!")
        else
            local choice = gg.choice(display, nil, "Pilih Akun")
            if choice then
                local sel = validList[choice]
                local ok, msg, typ = validateAccount(sel.user, sel.pass)
                if ok then
                    gg.alert("✅ LOGIN BERHASIL!")
                    applyAntiDetect()
                    local ScriptURL = getScriptURL(typ)
                    gg.toast("Mengunduh script " .. typ .. "...")
                    local resp = gg.makeRequest(ScriptURL)
                    if resp and resp.content and #resp.content > 100 then
                        local success = pcall(function() load(resp.content)() end)
                        if success then
                            gg.alert("🎉 INJECT BERHASIL!")
                            return
                        end
                    end
                else
                    gg.alert(msg)
                end
            end
        end

    elseif menu == 2 or (not hasSaved and menu == 1) then
        -- Login Password Only
        applyAntiDetect()
        local Result = gg.prompt({"🔑 MASUKKAN PASSWORD"}, {""}, {"text"})
        if Result and Result[1] then
            local pass = Result[1]
            local loggedIn = false
            for user, account in pairs(Accounts) do
                if account.password == pass then
                    local ok, _, typ = validateAccount(user, pass)
                    if ok then
                        saveLogin(user, pass)
                        gg.alert("✅ LOGIN BERHASIL!")
                        applyAntiDetect()
                        local ScriptURL = getScriptURL(typ)
                        gg.toast("Mengunduh script " .. typ .. "...")
                        local resp = gg.makeRequest(ScriptURL)
                        if resp and resp.content and #resp.content > 100 then
                            pcall(function() load(resp.content)() end)
                            gg.alert("🎉 INJECT BERHASIL!")
                            return
                        end
                    end
                    loggedIn = true
                    break
                end
            end
            if not loggedIn then gg.alert("❌ Password salah!") end
        end

    elseif menu == 3 then
        -- Akun Management
        local sub = gg.choice({
            "🗑️ Hapus Akun Tertentu",
            "📜 Login History",
            "ℹ️ Info Akun Lengkap"
        }, nil, "Akun Management")
        if sub == 1 then deleteSpecificAccount()
        elseif sub == 2 then showLoginHistory()
        elseif sub == 3 then showAccountInfo()
        end

    elseif menu == 4 then
        -- Pengaturan
        local sub = gg.choice({
            "🔄 Reset HWID",
            "🛡️ Toggle Anti-Detect"
        }, nil, "Pengaturan")
        if sub == 1 then gg.alert("✅ HWID berhasil di-reset!")
        elseif sub == 2 then 
            antiDetect = not antiDetect
            gg.alert("Anti-Detect: " .. (antiDetect and "ON" or "OFF"))
        end
    end
end