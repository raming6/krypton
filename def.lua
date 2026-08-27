local env = getgenv()

if not env then warn("Krypton Error 2") return end

if getscriptclosure then env.getscriptfunction = getscriptclosure end
if hookfunction then env.replaceclosure = hookfunction end
if isexecutorclosure then env.isourclosure = isexecutorclosure end
if isexecutorclosure then env.checkclosure = isexecutorclosure end

if rconsoleclear then env.consoleclear = rconsoleclear end
if rconsolecreate then env.consolecreate = rconsolecreate end
if rconsoledestroy then env.consoledestroy = rconsoledestroy end
if rconsoleinput then env.consoleinput = rconsoleinput end
if rconsoleprint then env.consoleprint = rconsoleprint end
if rconsolesettitle then
    env.rconsolename = rconsolesettitle
    env.consolesettitle = rconsolesettitle
end

if crypt and crypt.base64encode then
    crypt.base64 = crypt.base64 or {}
    crypt.base64.encode = crypt.base64encode
    env.base64 = env.base64 or {}
    env.base64.encode = crypt.base64encode
    env.base64_encode = crypt.base64encode
end

if crypt and crypt.base64decode then
    crypt.base64 = crypt.base64 or {}
    crypt.base64.decode = crypt.base64decode
    env.base64 = env.base64 or {}
    env.base64.decode = crypt.base64decode
    env.base64_decode = crypt.base64decode
end

if isrbxactive then env.isgameactive = isrbxactive end

if identifyexecutor then env.getexecutorname = identifyexecutor end

if queue_on_teleport then env.queueonteleport = queue_on_teleport end

if request then
    env.http = env.http or {}
    env.http.request = request
    env.http_request = request
end

if setclipboard then env.toclipboard = setclipboard end

if getthreadidentity then
    env.getidentity = getthreadidentity
    env.getthreadcontext = getthreadidentity
end

if setthreadidentity then
    env.setidentity = setthreadidentity
    env.setthreadcontext = setthreadidentity
end

if getscriptbytecode then env.dumpstring = getscriptbytecode end
