-- @ScriptType: ModuleScript
return {
	{
		ID="Encounter17", MinAge=22, MaxAge=40, MinYear=1970, MaxYear=9999,
		Text="A position opened up at the Speedwagon Foundation.",
		IsAvailable=function(s) return s.Job~="Foundation Agent" and s.Job~="Stand Specialist" end,
		Options={
			{Text="Apply for Field Agent", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="Your skills were recognized! You are now a Field Agent.", StatChanges={Job="Foundation Agent", Salary=3000, Happiness=8}}, {Weight=function(s) return 100-s.Intelligence+30 end, ResultText="You failed the background check miserably.", StatChanges={Happiness=-5}}}},
			{Text="Show your Stand", IsAvailable=function(s) return s.Stand~="None" end, Outcomes={{Weight=10, ResultText="You manifested your Stand. They hired you as a Specialist immediately.", StatChanges={Job="Stand Specialist", Salary=4500, Happiness=12}}}},
			{Text="Ignore it", Outcomes={{Weight=10, ResultText="You decided not to get involved with shady billionaires.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Encounter19", MinAge=18, MaxAge=999, MinYear=1800, MaxYear=1920,
		Text="A horse-drawn carriage kicks up mud right onto your best clothes.",
		Options={
			{Text="Yell at the driver", Outcomes={{Weight=5, ResultText="The driver felt awful and tossed you some coins for the trouble.", StatChanges={Money=20, Happiness=-3}}, {Weight=5, ResultText="The driver ignored you completely.", StatChanges={Happiness=-8}}}},
			{Text="Clean it off", Outcomes={{Weight=10, ResultText="You wiped off the worst of it, but the stain will linger.", StatChanges={Happiness=-3}}}},
			{Text="Crazy Diamond: Fix clothes", IsAvailable=function(s) return s.Stand=="Crazy Diamond" end, Outcomes={{Weight=10, ResultText="You restored the dirt to the ground! Your clothes are pristine.", StatChanges={Happiness=8}}}}
		}
	},
	{
		ID="Encounter21", MinAge=18, MaxAge=999, MinYear=1920, MaxYear=9999,
		Text="You got a flat tire on the highway in the pouring rain.",
		Options={
			{Text="Change it yourself", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You successfully swapped the tire and got home safe.", StatChanges={Intelligence=4, Strength=2}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="The jack slipped and the car pinched your hand.", StatChanges={LifeForce=-12, Happiness=-10}}}},
			{Text="Crazy Diamond: Repair Tire", IsAvailable=function(s) return s.Stand=="Crazy Diamond" end, Outcomes={{Weight=10, ResultText="You punched the tire and completely restored it! Perfect fix.", StatChanges={Happiness=12}}}},
			{Text="Star Platinum: Lift Car", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="Your Stand lifted the car effortlessly while you changed the tire.", StatChanges={Happiness=8}}}},
			{Text="Gold Experience: Grow a Tire", IsAvailable=function(s) return s.Stand=="Gold Experience" end, Outcomes={{Weight=10, ResultText="You turned a rock into a rubber tire. It worked surprisingly well!", StatChanges={Happiness=10}}}},
			{Text="Call a tow truck ($150)", IsAvailable=function(s) return s.Money>=150 end, Outcomes={{Weight=10, ResultText="They fixed it quickly, but it cost a pretty penny.", StatChanges={Money=-150, Happiness=-3}}}}
		}
	},
	{
		ID="Encounter29", MinAge=18, MaxAge=999, MinYear=2015, MaxYear=9999,
		Text="You went on a blind date, but they haven't stopped talking about crypto for an hour.",
		Options={
			{Text="Politely listen", Outcomes={{Weight=10, ResultText="You suffered through the night. It was exhausting.", StatChanges={Happiness=-8, LifeForce=-3}}}},
			{Text="Fake an emergency", Outcomes={{Weight=7, ResultText="You successfully escaped the date and went home to relax.", StatChanges={Happiness=6}}, {Weight=3, ResultText="They caught you lying and made a massive scene at the restaurant.", StatChanges={Happiness=-15}}}},
			{Text="Star Platinum: Stop Time & Leave", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="You stopped time and walked out. They were utterly confused.", StatChanges={Happiness=10}}}}
		}
	}
}