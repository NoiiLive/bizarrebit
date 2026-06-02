-- @ScriptType: ModuleScript
return {
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
		ID="Encounter18", MinAge=10, MaxAge=25, MinYear=1980, MaxYear=2005,
		Text="You found an old arcade cabinet with an unbeatable high score.",
		Options={
			{Text="Insert coin and play", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You figured out the boss patterns and beat the high score!", StatChanges={Happiness=12, Intelligence=2}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="You spent all your allowance and lost on level three.", StatChanges={Happiness=-8, Money=-10}}}},
			{Text="Watch someone else play", Outcomes={{Weight=10, ResultText="You enjoyed the flashing lights and learned a few neat tricks.", StatChanges={Intelligence=2, Happiness=2}}}}
		}
	},
	{
		ID="Teen_Driving", MinAge=15, MaxAge=19, MinYear=1920, MaxYear=9999,
		Text="It is time for your driver's license test.",
		Options={
			{Text="Drive carefully", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You parallel parked perfectly and got your license!", StatChanges={Happiness=10, Intelligence=2}}, {Weight=function(s) return 100-s.Intelligence+10 end, ResultText="You accidentally hit a traffic cone and failed.", StatChanges={Happiness=-10}}}},
			{Text="Show off your drifting", Outcomes={{Weight=2, ResultText="The instructor was terrified but impressed. You passed!", StatChanges={Happiness=15, Strength=2, Bizarreness=2}}, {Weight=8, ResultText="You immediately crashed into a stop sign.", StatChanges={LifeForce=-5, Happiness=-15}}}}
		}
	},
	{
		ID="Teen_Prom", MinAge=16, MaxAge=19, MinYear=1950, MaxYear=9999,
		Text="The annual school dance is tonight.",
		Options={
			{Text="Ask your crush", Outcomes={{Weight=function(s) return s.Luck+s.Happiness end, ResultText="They said yes! You had an incredible night.", StatChanges={Happiness=15}}, {Weight=50, ResultText="They turned you down in front of everyone.", StatChanges={Happiness=-20}}}},
			{Text="Go with friends", Outcomes={{Weight=10, ResultText="You danced terribly but had a fantastic time.", StatChanges={Happiness=8, Body=2}}}},
			{Text="Stay home and game", Outcomes={{Weight=10, ResultText="You beat a very hard boss level in peace.", StatChanges={Intelligence=3, Happiness=2}}}}
		}
	},
	{
		ID="Teen_SneakOut", MinAge=14, MaxAge=18, MinYear=0, MaxYear=9999,
		Text="Your friends throw pebbles at your window, asking you to sneak out at midnight.",
		Options={
			{Text="Sneak out", Outcomes={{Weight=6, ResultText="You roamed the empty streets and felt totally free.", StatChanges={Happiness=10, Strength=2}}, {Weight=4, ResultText="Your parents caught you immediately. You are heavily grounded.", StatChanges={Happiness=-15, LifeForce=-2}}}},
			{Text="Go back to sleep", Outcomes={{Weight=10, ResultText="You woke up well-rested and responsible.", StatChanges={Body=5, Happiness=-2}}}}
		}
	},
	{
		ID="Teen_Rebellion", MinAge=14, MaxAge=19, MinYear=1970, MaxYear=9999,
		Text="You feel an overwhelming urge to pierce your own ear with a safety pin.",
		Options={
			{Text="Do it yourself", Outcomes={{Weight=5, ResultText="It hurt badly, but it looks incredibly edgy.", StatChanges={Happiness=5, Bizarreness=2, LifeForce=-3}}, {Weight=5, ResultText="It got heavily infected immediately.", StatChanges={Body=-10, Happiness=-8}}}},
			{Text="Go to a professional ($20)", IsAvailable=function(s) return s.Money>=20 end, Outcomes={{Weight=10, ResultText="It healed perfectly and looks great.", StatChanges={Money=-20, Happiness=8}}}},
			{Text="Change your mind", Outcomes={{Weight=10, ResultText="You decided your ears were fine as they are.", StatChanges={Intelligence=2}}}}
		}
	},
	{
		ID="Teen_AbandonedSpot", MinAge=13, MaxAge=19, MinYear=0, MaxYear=9999,
		Text="You find an eerie, abandoned warehouse on the edge of the woods.",
		Options={
			{Text="Explore inside", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You found some cool old vintage signs you can sell.", StatChanges={Money=40, Happiness=5, Bizarreness=3}}, {Weight=function(s) return 100-s.Intelligence+10 end, ResultText="You stepped on a rusty nail and had to get a tetanus shot.", StatChanges={LifeForce=-10, Happiness=-10}}}},
			{Text="Leave it alone", Outcomes={{Weight=10, ResultText="You stayed out of trouble.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Teen_RollerRink", MinAge=13, MaxAge=19, MinYear=1980, MaxYear=1989,
		Text="Everyone is going to the neon-lit roller rink tonight.",
		Options={
			{Text="Show off your moves", Outcomes={{Weight=function(s) return s.Body end, ResultText="You glided backwards flawlessly. Everyone cheered!", StatChanges={Happiness=12, Body=3}}, {Weight=function(s) return 100-s.Body+20 end, ResultText="You wiped out and bruised your tailbone.", StatChanges={LifeForce=-5, Happiness=-8}}}},
			{Text="Sit at the snack bar", Outcomes={{Weight=10, ResultText="You ate way too much pizza and watched people fall.", StatChanges={Body=-2, Happiness=4}}}}
		}
	},
	{
		ID="Teen_TradingCards", MinAge=13, MaxAge=18, MinYear=1995, MaxYear=2005,
		Text="A new holographic monster trading card game is sweeping the school.",
		Options={
			{Text="Buy a pack ($5)", IsAvailable=function(s) return s.Money>=5 end, Outcomes={{Weight=2, ResultText="You pulled the ultra-rare sparkling dragon! You are rich!", StatChanges={Money=200, Happiness=15}}, {Weight=8, ResultText="You got entirely useless duplicate cards.", StatChanges={Money=-5, Happiness=-5}}}},
			{Text="Battle the champion", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You outsmarted their trap cards and won respect.", StatChanges={Happiness=10, Intelligence=3}}, {Weight=function(s) return 100-s.Intelligence+10 end, ResultText="They wiped out your life points in two turns.", StatChanges={Happiness=-8}}}}
		}
	},
	{
		ID="Teen_FlipPhone", MinAge=13, MaxAge=19, MinYear=2000, MaxYear=2010,
		Text="You just got your first flip phone with custom polyphonic ringtones.",
		Options={
			{Text="Text friends all night", Outcomes={{Weight=10, ResultText="Your thumbs ache and you are exhausted, but you feel popular.", StatChanges={Happiness=8, LifeForce=-5}}}},
			{Text="Compose a ringtone", Outcomes={{Weight=10, ResultText="You painstakingly typed out the notes to a cool song.", StatChanges={Intelligence=4, Happiness=5}}}}
		}
	},
	{
		ID="Teen_ViralChallenge", MinAge=13, MaxAge=19, MinYear=2010, MaxYear=2019,
		Text="A bizarre internet challenge involving eating a spoonful of dry cinnamon is trending.",
		Options={
			{Text="Do the challenge", Outcomes={{Weight=2, ResultText="You somehow swallowed it perfectly. The internet loves you.", StatChanges={Happiness=15, Bizarreness=5}}, {Weight=8, ResultText="You instantly choked and coughed an immense cloud of dust.", StatChanges={Body=-10, LifeForce=-5, Happiness=-10}}}},
			{Text="Ignore it", Outcomes={{Weight=10, ResultText="You refused to do something so obviously dangerous.", StatChanges={Intelligence=5, Happiness=2}}}}
		}
	}
}