function FormatTime(time_value)
	local ispositive = true
	if time_value < 0 then
		ispositive = false
	end
	time_value = math.abs(time_value)
	local toreturn = ""
	if time_value == 0 then
		return "-" -- If this didnt happen we would get a NaN output
	else
		if time_value >= 60*60*24*30*12 then -- Percision is very bad here
			toreturn = s.Comma(math.floor(((((((time_value)/60)/60)/24)/30)/12))) .. "yr " .. s.Comma(math.floor((((((time_value)/60)/60)/24)/30)%12)) .. "mo " .. s.Comma(math.floor(((((time_value)/60)/60)/24)%30)) .. "d " .. s.Comma(math.floor((((time_value)/60)/60)%24)) .. "h " .. s.Comma(math.floor(((time_value)/60)%60)) .. "m " .. s.Comma(time_value % 60) .. "s"
		elseif time_value >= 60*60*24*30 then
			toreturn = s.Comma(math.floor((((((time_value)/60)/60)/24)/30)%12)) .. "mo " .. s.Comma(math.floor(((((time_value)/60)/60)/24)%30)) .. "d " .. s.Comma(math.floor((((time_value)/60)/60)%24)) .. "h " .. s.Comma(math.floor(((time_value)/60)%60)) .. "m " .. s.Comma(time_value % 60) .. "s"
		elseif time_value >= 60*60*24 then
			toreturn = s.Comma(math.floor(((((time_value)/60)/60)/24)%30)) .. "d " .. s.Comma(math.floor((((time_value)/60)/60)%24)) .. "h " .. s.Comma(math.floor(((time_value)/60)%60)) .. "m " .. s.Comma(time_value % 60) .. "s"
		elseif time_value >= 60*60 then
			toreturn = s.Comma(math.floor((((time_value)/60)/60)%24)) .. "h " .. s.Comma(math.floor(((time_value)/60)%60)) .. "m " .. s.Comma(time_value % 60) .. "s"
		elseif time_value >= 60 then
			toreturn = s.Comma(math.floor(((time_value)/60)%60)) .. "m " .. s.Comma(time_value % 60) .. "s"
		elseif time_value >= 1 then
			toreturn = s.Comma(time_value) .. "s"
		elseif time_value >= 1e-3 then
			toreturn = s.Comma(time_value*1e3) .. "ms"
		elseif time_value >= 1e-6 then
			toreturn = s.Comma(time_value*1e6) .. "µs"
		elseif time_value >= 1e-9 then
			toreturn = s.Comma(time_value*1e9) .. "ns"
		elseif time_value >= 1e-12 then
			toreturn = s.Comma(time_value*1e12) .. "ps"
		elseif time_value >= 1e-15 then
			toreturn = s.Comma(time_value*1e15) .. "fs"
		elseif time_value >= 1e-18 then
			toreturn = s.Comma(time_value*1e18) .. "as"
		elseif time_value >= 1e-21 then
			toreturn = s.Comma(time_value*1e21) .. "zs"
		elseif time_value >= 1e-24 then
			toreturn = s.Comma(time_value*1e24) .. "ys"
		elseif time_value >= 5.391247e-44 then
			toreturn = s.Comma(time_value*5.391247e44) .. "tPs" -- Planck Second (percision)
		else
			toreturn = "1/" .. s.Comma(1/(time_value*5.391247e44)) .. "tPs" -- If anything, return this
		end
	end
	
	return (if not ispositive then "-" else "") .. toreturn
end
