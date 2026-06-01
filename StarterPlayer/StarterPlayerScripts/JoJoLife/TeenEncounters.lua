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
	}
}