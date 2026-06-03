-- @ScriptType: ModuleScript
local StatsManager = {}

StatsManager.FirstNames = {
	Male = {
		"Jotaro", "Joseph", "Josuke", "Giorno", "Jonathan", "Dio", "Bruno", "Guido", "Narancia",
		"Koichi", "Okuyasu", "Rohan", "Caesar", "Kakyoin", "Polnareff", "Johnny", "Jodio",
		"Muhammad", "Iggy", "Hol", "Jail", "Weather", "Enrico", "Diavolo", "Vinegar", "Risotto",
		"Prosciutto", "Illuso", "Pesci", "Formaggio", "Melone", "Ghiaccio", "Leone", "Pannacotta",
		"Diego", "Gyro", "Funny", "Hot", "Sandman", "Jobin", "Tsurugi", "Norisuke", "Joshu",
		"James", "Robert", "Richard", "Thomas", "Charles", "Christopher", "Daniel", "Matthew",
		"Anthony", "Mark", "Donald", "Steven", "Paul", "Kenneth", "Kevin", "Brian", "George",
		"Edward", "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan", "Gary", "Nicholas", "Eric", "Stephen"
	},
	Female = {
		"Jolyne", "Erina", "Lisa", "Suzi", "Holly", "Reimi", "Trish", "Hermes", "Lucy", "Yasuho",
		"Yukako", "Shizuka", "Tomoko", "Holy", "Anne", "Enya", "Mariah", "Midler", "Hot",
		"Sarah", "Emma", "Emily", "Jessica", "Ashley", "Amanda", "Megan", "Hannah", "Elizabeth",
		"Linda", "Barbara", "Susan", "Margaret", "Dorothy", "Alice", "Nancy", "Karen", "Betty",
		"Helen", "Sandra", "Donna", "Carol", "Ruth", "Sharon", "Michelle", "Laura", "Kimberly",
		"Deborah", "Cynthia", "Kathleen", "Amy", "Shirley", "Angela", "Anna", "Brenda", "Pamela"
	}
}

StatsManager.LastNames = {
	"Kujo", "Joestar", "Higashikata", "Giovanna", "Cujoh", "Brando", "Bucciarati", "Mista", "Ghirga", "Zeppeli",
	"Hirose", "Nijimura", "Kishibe", "Pendleton", "Pucci", "Joestar", "Anvol", "Kakyoin", "Polnareff",
	"Joestar", "Brando", "Zeppeli", "Speedwagon", "Stroheim", "Valentine", "Higashikata", "Kira",
	"Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Wilson",
	"Martinez", "Anderson", "Taylor", "Thomas", "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson",
	"White", "Harris", "Clark", "Lewis", "Robinson", "Walker", "Young", "Allen", "King", "Wright",
	"Scott", "Torres", "Nguyen", "Hill", "Flores", "Green", "Adams", "Nelson", "Baker", "Hall", "Steel"
}

StatsManager.StartingYears = {1868, 1920, 1971, 1983, 1992}

StatsManager.Stats = {
	IsDead = false,
	FirstName = "",
	LastName = "",
	Gender = "Male",
	Race = "Human",
	Stand = "None",
	Job = "Unemployed",
	Salary = 0,
	Year = 2026,
	Age = 0,
	Happiness = 100,
	Intelligence = 50,
	Money = 0,
	Strength = 50,
	Body = 100,
	LifeForce = 100,
	Luck = 50,
	Bizarreness = 0,
	LifespanRoll = 1.0,
	SeenEvents = {},
	Relationships = {},
	EventTarget = nil,
	NewFriend = ""
}

StatsManager.MaxStats = {
	Happiness = 100,
	Intelligence = 100,
	Strength = 100,
	Body = 100,
	LifeForce = 100
}

function StatsManager.ResetStats()
	StatsManager.Stats.IsDead = false
	StatsManager.Stats.Gender = math.random() > 0.5 and "Male" or "Female"

	local namePool = StatsManager.Stats.Gender == "Male" and StatsManager.FirstNames.Male or StatsManager.FirstNames.Female
	StatsManager.Stats.FirstName = namePool[math.random(1, #namePool)]
	StatsManager.Stats.LastName = StatsManager.LastNames[math.random(1, #StatsManager.LastNames)]

	StatsManager.Stats.Race = "Human"
	StatsManager.Stats.Stand = "None"
	StatsManager.Stats.Job = "Unemployed"
	StatsManager.Stats.Salary = 0
	StatsManager.Stats.Year = StatsManager.StartingYears[math.random(1, #StatsManager.StartingYears)]
	StatsManager.Stats.Age = 0

	StatsManager.Stats.Happiness = 100
	StatsManager.Stats.Intelligence = math.random(20, 80)
	StatsManager.Stats.Money = 0

	StatsManager.Stats.Strength = math.random(20, 80)
	StatsManager.Stats.Body = math.random(40, 100)
	StatsManager.Stats.LifeForce = math.random(50, 100)

	StatsManager.Stats.Luck = math.random(1, 100)
	StatsManager.Stats.Bizarreness = 0
	StatsManager.Stats.LifespanRoll = 0.8 + (math.random() * 0.2)

	StatsManager.Stats.SeenEvents = {}
	StatsManager.Stats.EventTarget = nil

	local fatherFirstName = StatsManager.FirstNames.Male[math.random(1, #StatsManager.FirstNames.Male)]
	local motherFirstName = StatsManager.FirstNames.Female[math.random(1, #StatsManager.FirstNames.Female)]
	local motherAge = math.random(20, 42)

	StatsManager.Stats.Relationships = {
		{Name = fatherFirstName .. " " .. StatsManager.Stats.LastName, Role = "Father", Age = math.random(22, 45), Race = "Human", LifespanRoll = 0.8 + (math.random() * 0.2), IsDead = false, Gender = "Male", Stand = "None", Closeness = math.random(60, 100)},
		{Name = motherFirstName .. " " .. StatsManager.Stats.LastName, Role = "Mother", Age = motherAge, Race = "Human", LifespanRoll = 0.8 + (math.random() * 0.2), IsDead = false, Gender = "Female", Stand = "None", Closeness = math.random(60, 100)}
	}

	local siblingChance = math.random(1, 100)
	local siblingCount = 0

	if siblingChance <= 30 then
		siblingCount = 1
	elseif siblingChance <= 45 then
		siblingCount = 2
	end

	for i = 1, siblingCount do
		local maxSiblingAge = motherAge - 18
		if maxSiblingAge >= 1 then
			local siblingAge = math.random(1, maxSiblingAge)
			local sibGender = math.random() > 0.5 and "Male" or "Female"
			local sibNamePool = sibGender == "Male" and StatsManager.FirstNames.Male or StatsManager.FirstNames.Female
			local sibName = sibNamePool[math.random(1, #sibNamePool)]
			local sibRole = sibGender == "Male" and "Brother" or "Sister"
			table.insert(StatsManager.Stats.Relationships, {
				Name = sibName .. " " .. StatsManager.Stats.LastName,
				Role = sibRole,
				Age = siblingAge,
				Race = "Human",
				LifespanRoll = 0.8 + (math.random() * 0.2),
				IsDead = false,
				Gender = sibGender,
				Stand = "None",
				Closeness = math.random(40, 90)
			})
		end
	end
end

function StatsManager.ContinueAs(childData)
	StatsManager.Stats.IsDead = false
	local splitName = string.split(childData.Name, " ")
	StatsManager.Stats.FirstName = splitName[1]
	if splitName[2] then
		StatsManager.Stats.LastName = splitName[2]
	end
	StatsManager.Stats.Gender = childData.Gender
	StatsManager.Stats.Age = childData.Age
	StatsManager.Stats.Race = childData.Race
	StatsManager.Stats.Stand = childData.Stand
	StatsManager.Stats.Job = "Unemployed"
	StatsManager.Stats.Salary = 0
	StatsManager.Stats.Happiness = 100
	StatsManager.Stats.Intelligence = math.random(20, 80)
	StatsManager.Stats.Strength = math.random(20, 80)
	StatsManager.Stats.Body = math.random(40, 100)
	StatsManager.Stats.LifeForce = math.random(50, 100)
	StatsManager.Stats.Luck = math.random(1, 100)
	StatsManager.Stats.Bizarreness = 0
	StatsManager.Stats.LifespanRoll = 0.8 + (math.random() * 0.2)
	StatsManager.Stats.SeenEvents = {}
	StatsManager.Stats.EventTarget = nil
	StatsManager.Stats.Relationships = {}
end

return StatsManager