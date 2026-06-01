-- @ScriptType: ModuleScript
local EncounterData = {}

EncounterData.Events = {
	{
		ID="ParentBonding1", MinAge=5, MaxAge=18, MinYear=0, MaxYear=9999,
		IsAvailable=function(s)
			for _, rel in ipairs(s.Relationships) do
				if not rel.IsDead and (rel.Role == "Mother" or rel.Role == "Father") then
					return true
				end
			end
			return false
		end,
		Setup=function(s)
			local valid = {}
			for _, rel in ipairs(s.Relationships) do
				if not rel.IsDead and (rel.Role == "Mother" or rel.Role == "Father") then
					table.insert(valid, rel)
				end
			end
			if #valid > 0 then s.EventTarget = valid[math.random(1, #valid)] end
		end,
		Text=function(s) return "Your " .. s.EventTarget.Role .. ", " .. s.EventTarget.Name .. ", asks if you want to spend the afternoon helping them with chores." end,
		Options={
			{Text="Help them happily", Outcomes={{Weight=10, ResultText=function(s) return "You spent quality time with your " .. s.EventTarget.Role .. "!" end, StatChanges={Closeness=10, Happiness=5}}}},
			{Text="Complain the whole time", Outcomes={{Weight=10, ResultText="You were completely insufferable to be around.", StatChanges={Closeness=-10, Happiness=-5}}}}
		}
	},
	{
		ID="SiblingTrouble1", MinAge=4, MaxAge=18, MinYear=0, MaxYear=9999,
		IsAvailable=function(s)
			for _, rel in ipairs(s.Relationships) do
				if not rel.IsDead and (rel.Role == "Brother" or rel.Role == "Sister") then
					return true
				end
			end
			return false
		end,
		Setup=function(s)
			local valid = {}
			for _, rel in ipairs(s.Relationships) do
				if not rel.IsDead and (rel.Role == "Brother" or rel.Role == "Sister") then
					table.insert(valid, rel)
				end
			end
			if #valid > 0 then s.EventTarget = valid[math.random(1, #valid)] end
		end,
		Text=function(s) return "Your " .. string.lower(s.EventTarget.Role) .. ", " .. s.EventTarget.Name .. ", breaks a vase and asks you to take the blame." end,
		Options={
			{Text="Take the blame", Outcomes={{Weight=10, ResultText=function(s) return "You covered for them. You got grounded, but your " .. string.lower(s.EventTarget.Role) .. " owes you one." end, StatChanges={Closeness=15, Happiness=-10}}}},
			{Text="Snitch immediately", Outcomes={{Weight=10, ResultText="You sold them out instantly. They are furious.", StatChanges={Closeness=-20, Happiness=5}}}}
		}
	},
	{
		ID="FriendArcade1", MinAge=8, MaxAge=999, MinYear=0, MaxYear=9999,
		IsAvailable=function(s)
			for _, rel in ipairs(s.Relationships) do
				if not rel.IsDead and rel.Role == "Friend" then
					return true
				end
			end
			return false
		end,
		Setup=function(s)
			local valid = {}
			for _, rel in ipairs(s.Relationships) do
				if not rel.IsDead and rel.Role == "Friend" then
					table.insert(valid, rel)
				end
			end
			if #valid > 0 then s.EventTarget = valid[math.random(1, #valid)] end
		end,
		Text=function(s) return "Your friend, " .. s.EventTarget.Name .. ", wants to go hang out at the local arcade." end,
		Options={
			{Text="Go with them ($5)", IsAvailable=function(s) return s.Money >= 5 end, Outcomes={{Weight=10, ResultText="You both had a blast playing fighting games!", StatChanges={Closeness=12, Happiness=10, Money=-5}}}},
			{Text="Decline", Outcomes={{Weight=10, ResultText="You decided to stay home. They went alone.", StatChanges={Closeness=-5, Happiness=-2}}}}
		}
	},
	{
		ID="Encounter1", MinAge=1, MaxAge=4, MinYear=0, MaxYear=9999,
		Text="You are trying to take your first steps, but the dog is in the way.",
		Options={
			{Text="Crawl around it", Outcomes={{Weight=8, ResultText="You successfully navigated the obstacle.", StatChanges={Intelligence=2}}, {Weight=2, ResultText="You bumped your head on the table leg.", StatChanges={LifeForce=-3, Happiness=-3}}}},
			{Text="Try to walk over it", Outcomes={{Weight=3, ResultText="You took your first steps! The dog was very confused.", StatChanges={Happiness=5, Strength=2}}, {Weight=7, ResultText="You fell directly onto the dog. It barked at you.", StatChanges={Happiness=-5}}}}
		}
	},
	{
		ID="Encounter2", MinAge=2, MaxAge=6, MinYear=1900, MaxYear=9999,
		Text="You found a colorful crayon on the floor.",
		Options={
			{Text="Draw on the wall", Outcomes={{Weight=6, ResultText="You created a masterpiece, but your parents were furious.", StatChanges={Happiness=4, Intelligence=2}}, {Weight=4, ResultText="You got put in time-out immediately.", StatChanges={Happiness=-8}}}},
			{Text="Eat it", Outcomes={{Weight=10, ResultText="It tasted like wax and stomach regrets.", StatChanges={Body=-5, Happiness=-5}}}}
		}
	},
	{
		ID="Encounter3", MinAge=3, MaxAge=8, MinYear=1900, MaxYear=9999,
		Text="You accidentally dropped your ice cream cone on the sidewalk.",
		Options={
			{Text="Cry loudly", Outcomes={{Weight=7, ResultText="Your parents felt bad and bought you another one.", StatChanges={Happiness=5}}, {Weight=3, ResultText="They told you to stop crying. You are now ice cream-less.", StatChanges={Happiness=-8}}}},
			{Text="Eat it off the ground", Outcomes={{Weight=10, ResultText="It was covered in dirt and ants. You feel terribly sick.", StatChanges={Body=-10, Happiness=-6}}}}
		}
	},
	{
		ID="Encounter4", MinAge=4, MaxAge=10, MinYear=0, MaxYear=9999,
		Text="You see another kid building an incredibly bizarre sandcastle.",
		Options={
			{Text="Help them build", Outcomes={{Weight=7, ResultText="You worked together and made a masterpiece! You hit it off instantly.", StatChanges={Happiness=8, NewFriend="Friend"}}, {Weight=3, ResultText="You accidentally knocked down a tower. They yelled at you.", StatChanges={Happiness=-5}}}},
			{Text="Kick it down", Outcomes={{Weight=10, ResultText="You destroyed their hard work. You feel like a villain.", StatChanges={Happiness=5, Bizarreness=2}}}}
		}
	},
	{
		ID="Encounter5", MinAge=5, MaxAge=11, MinYear=0, MaxYear=9999,
		Text="A strange stray dog with a severe underbite just stole your lunch.",
		Options={
			{Text="Chase it", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You caught up and got your food back, getting a good workout.", StatChanges={Strength=4, Happiness=3}}, {Weight=function(s) return 100-s.Strength+10 end, ResultText="It ran way too fast. You tripped and scraped your knee.", StatChanges={LifeForce=-6, Happiness=-6}}}},
			{Text="Offer it coffee flavored gum", Outcomes={{Weight=8, ResultText="The dog happily took the gum and left you alone. Weird.", StatChanges={Happiness=4}}, {Weight=2, ResultText="It hated the gum and bit your ankle.", StatChanges={LifeForce=-8, Happiness=-8}}}},
			{Text="Cry about it", Outcomes={{Weight=10, ResultText="Someone felt bad and bought you a better lunch.", StatChanges={Happiness=6, Body=2}}}},
			{Text="Star Platinum: Catch it!", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="Star Platinum caught the dog in the blink of an eye. You got your lunch back flawlessly.", StatChanges={Happiness=8, Strength=2, Bizarreness=2}}}}
		}
	},
	{
		ID="Encounter6", MinAge=5, MaxAge=12, MinYear=0, MaxYear=9999,
		Text="A kid in the sandbox claims his dad is a famous marine biologist.",
		Options={
			{Text="Ask about dolphins", Outcomes={{Weight=8, ResultText="He told you amazing facts about ocean life and you hit it off.", StatChanges={Intelligence=6, Happiness=4, NewFriend="Friend"}}, {Weight=2, ResultText="He ignored you and kept digging.", StatChanges={Happiness=-3}}}},
			{Text="Call him a liar", Outcomes={{Weight=function(s) return s.Strength end, ResultText="He tried to push you, but you stood your ground.", StatChanges={Happiness=3}}, {Weight=function(s) return 100-s.Strength+20 end, ResultText="He threw sand in your eyes.", StatChanges={LifeForce=-6, Happiness=-8}}}},
			{Text="Show him a cool rock", Outcomes={{Weight=10, ResultText="You traded the rock for a neat starfish shell.", StatChanges={Happiness=6}}}}
		}
	},
	{
		ID="Encounter7", MinAge=6, MaxAge=12, MinYear=1800, MaxYear=9999, IsBizarre=true,
		Text="During a museum field trip, you find a weirdly sharp stone mask.",
		Options={
			{Text="Try it on", Outcomes={{Weight=3, ResultText="It didn't fit, but you felt a cold surge of ancient energy.", StatChanges={Body=4, Intelligence=2, Bizarreness=4}}, {Weight=7, ResultText="You scratched your face on the stone and got in trouble.", StatChanges={LifeForce=-8, Happiness=-8}}}},
			{Text="Read the plaque", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You learned about ancient Mesoamerican rituals.", StatChanges={Intelligence=8}}, {Weight=20, ResultText="The words were too big for you to understand.", StatChanges={Happiness=-3}}}},
			{Text="Walk away", Outcomes={{Weight=10, ResultText="You went to look at the dinosaurs instead.", StatChanges={Happiness=4}}}}
		}
	},
	{
		ID="Encounter8", MinAge=6, MaxAge=10, MinYear=1880, MaxYear=9999,
		Text="Your dad is trying to teach you how to ride a bicycle without training wheels.",
		Options={
			{Text="Pedal as hard as you can", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You caught your balance and rode all the way down the street!", StatChanges={Happiness=8, Strength=4}}, {Weight=function(s) return 100-s.Strength+20 end, ResultText="You completely lost control and crashed into a mailbox.", StatChanges={LifeForce=-10, Happiness=-6}}}},
			{Text="Refuse to let go", Outcomes={{Weight=10, ResultText="You stayed safe, but didn't learn anything new today.", StatChanges={Happiness=-3}}}}
		}
	},
	{
		ID="Encounter9", MinAge=1, MaxAge=10, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You found a bizarre, colorful stag beetle in the yard.",
		Options={
			{Text="Watch it", Outcomes={{Weight=7, ResultText="You observed its strange patterns and learned about nature.", StatChanges={Intelligence=6, Happiness=4, Bizarreness=2}}, {Weight=3, ResultText="It spit a weird liquid in your eye.", StatChanges={LifeForce=-8, Happiness=-6}}}},
			{Text="Squish it", Outcomes={{Weight=4, ResultText="You smashed it, but feel strangely guilty.", StatChanges={Happiness=-6}}, {Weight=6, ResultText="It was incredibly fast and pinched your finger.", StatChanges={LifeForce=-6, Happiness=-3}}}},
			{Text="Put it in a jar", Outcomes={{Weight=8, ResultText="You caught it! It looks cool on your desk.", StatChanges={Happiness=6}}, {Weight=2, ResultText="It broke through the glass and escaped.", StatChanges={Happiness=-6}}}},
			{Text="Gold Experience: Transform it", IsAvailable=function(s) return s.Stand=="Gold Experience" end, Outcomes={{Weight=10, ResultText="You turned the beetle into a beautiful flower. It filled you with peace.", StatChanges={Happiness=12, Bizarreness=4}}}}
		}
	},
	{
		ID="Encounter10", MinAge=11, MaxAge=17, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You notice a peculiar star-shaped birthmark on the back of your shoulder.",
		IsAvailable=function(s) local n={Joestar=true,Kujo=true,Higashikata=true,Giovanna=true,Cujoh=true} return n[s.LastName]==true end,
		Options={
			{Text="Research its shape", Outcomes={{Weight=7, ResultText="You fell down a rabbit hole of genealogy and feel a deep sense of destiny.", StatChanges={Intelligence=10, Happiness=8, Bizarreness=6}}, {Weight=3, ResultText="You read a scary forum post that convinced you it's a curse.", StatChanges={Happiness=-10}}}},
			{Text="Show a doctor ($20)", IsAvailable=function(s) return s.Money>=20 end, Outcomes={{Weight=8, ResultText="The doctor says it's perfectly healthy skin.", StatChanges={Happiness=4, Money=-20}}, {Weight=2, ResultText="The doctor panicked and prescribed you heavy ointments.", StatChanges={Body=-3, Happiness=-6, Money=-20}}}},
			{Text="Cover it up", Outcomes={{Weight=10, ResultText="You wore a jacket. Nobody noticed, but you feel slightly stifled.", StatChanges={Happiness=-3}}}}
		}
	},
	{
		ID="Encounter11", MinAge=13, MaxAge=18, MinYear=1850, MaxYear=9999,
		Text="You have a massive final exam in math today, and you barely studied.",
		Options={
			{Text="Try your best", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You remembered enough to pass with a decent grade!", StatChanges={Intelligence=4, Happiness=6}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="You failed miserably and your parents grounded you.", StatChanges={Happiness=-12}}}},
			{Text="Cheat off the smart kid", Outcomes={{Weight=4, ResultText="You got an A! You feel dirty, but relieved.", StatChanges={Happiness=4}}, {Weight=6, ResultText="The teacher caught you. You got a zero and detention.", StatChanges={Happiness=-15, Intelligence=-3}}}},
			{Text="Star Platinum: Stop Time", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="You stopped time and looked at the answer sheet. A flawless victory.", StatChanges={Intelligence=6, Happiness=12}}}},
			{Text="Crazy Diamond: Revert the Test", IsAvailable=function(s) return s.Stand=="Crazy Diamond" end, Outcomes={{Weight=10, ResultText="You reverted the teacher's answer key ink to find the answers! Sneaky.", StatChanges={Intelligence=6, Happiness=12}}}}
		}
	},
	{
		ID="Encounter12", MinAge=14, MaxAge=18, MinYear=1980, MaxYear=9999,
		Text="A transfer student with a strange hairstyle sits next to you in class.",
		Options={
			{Text="Compliment their hair", Outcomes={{Weight=8, ResultText="They beamed with joy and talked to you all period. You made a friend!", StatChanges={Happiness=6, NewFriend="Friend"}}, {Weight=2, ResultText="They thought you were being sarcastic and glared at you.", StatChanges={Happiness=-4}}}},
			{Text="Insult their hair", Outcomes={{Weight=10, ResultText="They flew into a blind rage and pummeled you into a desk!", StatChanges={LifeForce=-15, Happiness=-10, Body=-5}}}},
			{Text="Ignore them", Outcomes={{Weight=10, ResultText="You focused on the lesson.", StatChanges={Intelligence=2}}}}
		}
	},
	{
		ID="Encounter13", MinAge=11, MaxAge=17, MinYear=1930, MaxYear=9999, IsBizarre=true,
		Text="You found a weird comic book that seems to predict things before they happen.",
		Options={
			{Text="Follow its instructions", Outcomes={{Weight=4, ResultText="You narrowly avoided a falling pot and found twenty dollars!", StatChanges={Happiness=12, Money=20, Bizarreness=4}}, {Weight=6, ResultText="You followed it blindly and walked straight into a telephone pole.", StatChanges={LifeForce=-10, Happiness=-8}}}},
			{Text="Study its art style", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="The bizarre art style inspired you. You feel creatively enriched.", StatChanges={Intelligence=8, Happiness=4}}, {Weight=20, ResultText="The distorted faces gave you a terrible headache.", StatChanges={LifeForce=-3, Happiness=-6}}}},
			{Text="Throw it away", Outcomes={{Weight=10, ResultText="You tossed it in the trash. Probably for the best.", StatChanges={Happiness=3}}}}
		}
	},
	{
		ID="Encounter14", MinAge=13, MaxAge=25, MinYear=0, MaxYear=9999,
		Text="A buff teenager posed menacingly at you in the hall.",
		Options={
			{Text="Pose back", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You struck a dramatic pose. Respect was earned, and you feel great.", StatChanges={Happiness=10, Strength=2}}, {Weight=function(s) return 100-s.Strength+10 end, ResultText="You pulled a muscle trying to bend that way.", StatChanges={LifeForce=-8, Happiness=-6}}}},
			{Text="Analyze their stance", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You figured out their center of gravity and learned about anatomy.", StatChanges={Intelligence=4}}, {Weight=function(s) return 100-s.Intelligence+10 end, ResultText="You stared too long and they punched you.", StatChanges={LifeForce=-10, Happiness=-8}}}},
			{Text="Walk away", Outcomes={{Weight=10, ResultText="You ignored them and went to class safely.", StatChanges={Intelligence=2}}}}
		}
	},
	{
		ID="Encounter15", MinAge=16, MaxAge=25, MinYear=1950, MaxYear=9999,
		Text="You noticed a 'Help Wanted' sign at a local fast food joint.",
		IsAvailable=function(s) return s.Job=="Unemployed" end,
		Options={
			{Text="Apply for Cashier", Outcomes={{Weight=function(s) return s.Intelligence+s.Happiness end, ResultText="You nailed the interview and got the job. Time to make some cash.", StatChanges={Job="Cashier", Salary=1000, Happiness=4}}, {Weight=50, ResultText="You stuttered through the questions and didn't get a call back.", StatChanges={Happiness=-8}}}},
			{Text="Ignore it", Outcomes={{Weight=10, ResultText="You kept walking. Your wallet remains empty.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Encounter16", MinAge=15, MaxAge=40, MinYear=1990, MaxYear=2010, IsBizarre=true,
		Text="A sharply dressed man offers you a position in his 'family' business.",
		IsAvailable=function(s) return s.Job=="Unemployed" end,
		Options={
			{Text="Accept the offer", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You passed the lighter test. You are now a Gangster.", StatChanges={Job="Gangster", Salary=2500, Bizarreness=6}}, {Weight=10, ResultText="You failed the initiation and were badly beaten.", StatChanges={LifeForce=-20, Happiness=-10}}}},
			{Text="Politely decline", Outcomes={{Weight=10, ResultText="He nods and walks away. You feel you dodged a bullet.", StatChanges={Happiness=2}}}},
			{Text="Gold Experience: Show your resolve", IsAvailable=function(s) return s.Stand=="Gold Experience" end, Outcomes={{Weight=10, ResultText="You demonstrated your golden dream. You are immediately made a Capo.", StatChanges={Job="Passione Capo", Salary=5000, Happiness=20}}}}
		}
	},
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
		ID="Encounter18", MinAge=10, MaxAge=25, MinYear=1980, MaxYear=2005,
		Text="You found an old arcade cabinet with an unbeatable high score.",
		Options={
			{Text="Insert coin and play", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You figured out the boss patterns and beat the high score!", StatChanges={Happiness=12, Intelligence=2}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="You spent all your allowance and lost on level three.", StatChanges={Happiness=-8, Money=-10}}}},
			{Text="Watch someone else play", Outcomes={{Weight=10, ResultText="You enjoyed the flashing lights and learned a few neat tricks.", StatChanges={Intelligence=2, Happiness=2}}}}
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
		ID="Encounter20", MinAge=18, MaxAge=999, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You found a weird old man doing breathing exercises on a park bench.",
		IsAvailable=function(s) return s.Race~="Hamon User" end,
		Options={
			{Text="Inhale deeply with him", IsAvailable=function(s) return s.Race=="Human" end, Outcomes={{Weight=6, ResultText="You feel a surge of solar energy flowing through your veins! You have mastered the Ripple.", StatChanges={Body=15, Happiness=8, Race="Hamon User", Bizarreness=6}}, {Weight=4, ResultText="You breathed in a bug and started coughing violently.", StatChanges={Body=-6, Happiness=-8}}}},
			{Text="Approach him", IsAvailable=function(s) return s.Race=="Vampire" or s.Race=="Zombie" end, Outcomes={{Weight=10, ResultText="He senses your undead aura instantly! He strikes you with a Sunlight Yellow Overdrive!", StatChanges={LifeForce=-100, Happiness=-50}}}},
			{Text="Record him or watch", Outcomes={{Weight=5, ResultText="You observed him closely. It was a fascinating spectacle.", StatChanges={Intelligence=4, Happiness=4}}, {Weight=5, ResultText="He smashed a rock with his bare hands and scared you away.", StatChanges={Happiness=-8}}}}
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
		ID="Encounter22", MinAge=18, MaxAge=999, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You found a strange, golden arrow in the attic of your new house.",
		IsAvailable=function(s) return s.Stand=="None" end,
		Options={
			{Text="Stab yourself with it", Outcomes={
				{Weight=function(s) return s.LifeForce+s.Body end, ResultText="You pierced your skin! A surge of bizarre energy awakens something deep within you.", StatChanges={LifeForce=20, Happiness=20, Stand="Star Platinum", Bizarreness=10}},
				{Weight=function(s) return s.LifeForce+s.Body end, ResultText="You pierced your skin! A surge of bizarre energy awakens something deep within you.", StatChanges={LifeForce=20, Happiness=20, Stand="Crazy Diamond", Bizarreness=10}},
				{Weight=function(s) return s.LifeForce+s.Body end, ResultText="You pierced your skin! A surge of bizarre energy awakens something deep within you.", StatChanges={LifeForce=20, Happiness=20, Stand="Gold Experience", Bizarreness=10}},
				{Weight=function(s) return 200-(s.LifeForce+s.Body)+60 end, ResultText="You just cut yourself and got a nasty infection. You lack the spiritual strength.", StatChanges={Body=-20, Happiness=-15}}
			}},
			{Text="Sell it to a collector", Outcomes={{Weight=6, ResultText="You sold the weird arrow to a frantic collector for a fortune.", StatChanges={Money=1500, Happiness=8}}, {Weight=4, ResultText="You got scammed and received fake currency.", StatChanges={Happiness=-8}}}}
		}
	},
	{
		ID="Encounter23", MinAge=18, MaxAge=999, MinYear=1980, MaxYear=9999, IsBizarre=true,
		Text="A man offers to play a high-stakes game of poker for your soul.",
		Options={
			{Text="Bet it all ($1000)", IsAvailable=function(s) return s.Money>=1000 end, Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You outsmarted his cheating! You won big.", StatChanges={Money=5000, Happiness=20}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="He stole your chips and part of your soul.", StatChanges={Money=-1000, LifeForce=-25, Happiness=-25}}}},
			{Text="Star Platinum: Bluff", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="You didn't even look at your cards. He folded in sheer terror.", StatChanges={Money=2000, Happiness=15}}}},
			{Text="Walk away", Outcomes={{Weight=10, ResultText="You refused to gamble. He seemed disappointed.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Encounter24", MinAge=18, MaxAge=999, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="A priest with peculiar hair starts talking to you about 'Gravity' and 'Heaven'.",
		Options={
			{Text="Listen closely", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="His philosophical words expanded your mind.", StatChanges={Intelligence=12, Happiness=6, Bizarreness=4}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="You got a severe headache trying to comprehend his logic.", StatChanges={LifeForce=-6, Happiness=-8}}}},
			{Text="Argue with him", Outcomes={{Weight=4, ResultText="You made a good counterpoint. He smiled and walked away.", StatChanges={Happiness=8, Intelligence=4}}, {Weight=6, ResultText="He tossed a bizarre disc at you that knocked you out cold.", StatChanges={LifeForce=-20, Happiness=-15}}}},
			{Text="Walk away", Outcomes={{Weight=10, ResultText="You politely excused yourself and went home.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Encounter25", MinAge=18, MaxAge=999, MinYear=1990, MaxYear=9999, IsBizarre=true,
		Text="You found a severed hand in a fast food bag you just bought.",
		Options={
			{Text="Call the police", Outcomes={{Weight=6, ResultText="The police took the bag as evidence. You are traumatized but safe.", StatChanges={Happiness=-20, Intelligence=4}}, {Weight=4, ResultText="A man in a purple suit intercepted you before you could dial.", StatChanges={LifeForce=-40, Happiness=-25}}}},
			{Text="Run away immediately", Outcomes={{Weight=8, ResultText="You sprinted away without looking back.", StatChanges={Happiness=-10}}, {Weight=2, ResultText="You ran straight into traffic in a panic.", StatChanges={LifeForce=-20, Happiness=-15}}}},
			{Text="Investigate the bag", Outcomes={{Weight=2, ResultText="You found a very nice ring on one of the fingers.", StatChanges={Money=500, Happiness=-10}}, {Weight=8, ResultText="A tiny tank emerged from the bag and blew you up.", StatChanges={LifeForce=-100, Happiness=-50}}}}
		}
	},
	{
		ID="Encounter26", MinAge=18, MaxAge=999, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="An enemy Stand user suddenly attacks you in the street!",
		IsAvailable=function(s) return s.Stand~="None" end,
		Options={
			{Text="ORA ORA ORA!", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="Star Platinum unleashes a devastating rush of punches! They are retired.", StatChanges={Money=250, Happiness=15, Strength=4, Bizarreness=6}}}},
			{Text="DORA RA RA!", IsAvailable=function(s) return s.Stand=="Crazy Diamond" end, Outcomes={{Weight=10, ResultText="You pummeled them and morphed them into a rock! Threat neutralized.", StatChanges={Money=250, Happiness=15, Strength=4, Bizarreness=6}}}},
			{Text="MUDA MUDA MUDA!", IsAvailable=function(s) return s.Stand=="Gold Experience" end, Outcomes={{Weight=10, ResultText="You beat them down and sent their senses out of control. Flawless victory.", StatChanges={Money=250, Happiness=15, Strength=4, Bizarreness=6}}}},
			{Text="Flee in terror", Outcomes={{Weight=5, ResultText="You managed to lose them in the crowd, but your pride is wounded.", StatChanges={Happiness=-8}}, {Weight=5, ResultText="They threw a projectile at your back as you ran.", StatChanges={LifeForce=-12, Happiness=-6}}}}
		}
	},
	{
		ID="Encounter27", MinAge=18, MaxAge=999, MinYear=1800, MaxYear=9999, IsBizarre=true,
		Text="A pale, aristocratic man in an alleyway offers you power in exchange for your humanity.",
		IsAvailable=function(s) return s.Race~="Vampire" and s.Race~="Zombie" end,
		Options={
			{Text="Accept his blood", IsAvailable=function(s) return s.Race=="Human" end, Outcomes={{Weight=4, ResultText="Your humanity slips away. You are now a Vampire! You feel incredibly strong.", StatChanges={Body=30, Race="Vampire", Bizarreness=8}}, {Weight=6, ResultText="Your body couldn't handle it. You are now a mindless Zombie.", StatChanges={Intelligence=-25, Body=15, Race="Zombie"}}}},
			{Text="Accept his blood", IsAvailable=function(s) return s.Race=="Hamon User" end, Outcomes={{Weight=10, ResultText="The vampiric essence violently clashes with the Hamon in your bloodstream! Your body melts away!", StatChanges={LifeForce=-999}}}},
			{Text="Use Hamon Overdrive", IsAvailable=function(s) return s.Race=="Hamon User" end, Outcomes={{Weight=10, ResultText="You channeled the power of the sun and melted the vampire away! You found his wallet.", StatChanges={Money=400, Happiness=20, Strength=4, Bizarreness=4}}}},
			{Text="Run away", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You managed to sprint out of the alley before he could grab you.", StatChanges={Happiness=3}}, {Weight=20, ResultText="He caught your leg and drained some of your blood before you escaped.", StatChanges={LifeForce=-20, Happiness=-15}}}}
		}
	},
	{
		ID="Encounter28", MinAge=18, MaxAge=999, MinYear=1900, MaxYear=9999, IsBizarre=true,
		Text="You found a strange Italian restaurant that looks extremely authentic.",
		Options={
			{Text="Eat the special ($80)", IsAvailable=function(s) return s.Money>=80 and s.Race~="Zombie" end, Outcomes={{Weight=8, ResultText="Your cavities fell out and regrew instantly! It was an incredibly healthy meal.", StatChanges={Body=25, Happiness=15, Money=-80, Bizarreness=4}}, {Weight=2, ResultText="It was too spicy and you had a terrible stomach ache.", StatChanges={Body=-6, Happiness=-10, Money=-80}}}},
			{Text="Eat the special (Zombie)", IsAvailable=function(s) return s.Money>=80 and s.Race=="Zombie" end, Outcomes={{Weight=10, ResultText="The healing food clashes with your undead biology. You melt slightly.", StatChanges={LifeForce=-25, Money=-80}}}},
			{Text="Crazy Diamond: Fix food", IsAvailable=function(s) return s.Stand=="Crazy Diamond" end, Outcomes={{Weight=10, ResultText="You punched the spaghetti and it turned back into its raw ingredients! The chef is furious.", StatChanges={Happiness=4, LifeForce=-3}}}},
			{Text="Just get water", Outcomes={{Weight=10, ResultText="The chef glared at you intensely. You left feeling uneasy.", StatChanges={Happiness=-3}}}}
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

return EncounterData