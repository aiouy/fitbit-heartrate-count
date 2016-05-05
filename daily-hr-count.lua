-- fitbit token, see README for instructions
local fitbitToken = "TOKENHERE"

-- set date	
-- local date = "2016-05-05"
local date = os.date("%Y-%m-%d") -- today

-- pull data from fitbit
local request = http.request {
	url = [[https://api.fitbit.com/1/user/-/activities/heart/date/]] .. date .. [[/1d/1sec.json]],
	method = "GET",
	headers = {
		authorization = "Bearer " .. fitbitToken
 	}
}

-- set data variable to the heartbeat dataset
local jsonData = json.parse(request.content)
local data = jsonData["activities-heart-intraday"].dataset

-- initial conditions
count = 0
startTime = "00:00:00"

-- loop through the data, adding to the count of heartbeats per interval
for i = 1, #data, 1 do
	
	-- break down start & end times
	_, _, h1, m1, s1 = string.find(startTime, "(%d+):(%d+):(%d+)")
	_, _, h2, m2, s2 = string.find(data[i].time, "(%d+):(%d+):(%d+)")
	
	-- calculate interval between start & end times
	interval = 3600*(h2-h1) + 60*(m2-m1) + (s2-s1)
	
	-- add to count the # of heart beats in that interval (so bpm / (60/interval))
	count = count + tonumber(data[i].value)/(60/interval)
	
	-- reset start time
	startTime = data[i].time
end

-- return integer
return "My heart beat " .. math.floor(count/1000) .. "k times today."
