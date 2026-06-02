-- @ScriptType: ModuleScript
return {
	{
		ID="Child_AngeloRock", MinAge=6, MaxAge=12, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You see a weirdly shaped rock by the road that looks exactly like a human face.",
		Options={
			{Text="Say 'Yo, Angelo!'", Outcomes={{Weight=10, ResultText="You greeted the rock. Strangely, you swear it grunted back.", StatChanges={Bizarreness=5, Happiness=6, Luck=2}}}},
			{Text="Kick it", Outcomes={{Weight=10, ResultText="You stubbed your toe on its weirdly hard nose.", StatChanges={LifeForce=-5, Happiness=-4}}}}
		}
	},
	{
		ID="Child_StrayCat", MinAge=5, MaxAge=11, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You find a bizarre flower in the garden that looks suspiciously like a cat's face.",
		Options={
			{Text="Pet it", Outcomes={{Weight=7, ResultText="It purred and rubbed its leaves against your hand.", StatChanges={Happiness=8, Bizarreness=4}}, {Weight=3, ResultText="It bit your finger with tiny, sharp petals.", StatChanges={Happiness=-4, LifeForce=-3}}}},
			{Text="Poke it with a stick", Outcomes={{Weight=10, ResultText="It violently shot a bubble of compressed air at your face!", StatChanges={LifeForce=-10, Happiness=-8, Bizarreness=5}}}}
		}
	},
	{
		ID="Child_Orangutan", MinAge=5, MaxAge=10, MinYear=1970, MaxYear=9999, IsBizarre=true,
		Text="At the zoo, you see a massive orangutan reading a magazine and smoking a cigar.",
		Options={
			{Text="Stare in awe", Outcomes={{Weight=10, ResultText="The ape tipped his sailor hat to you. Truly bizarre.", StatChanges={Intelligence=4, Bizarreness=6, Happiness=3}}}},
			{Text="Throw a peanut at it", Outcomes={{Weight=10, ResultText="It glared at you and threw a heavy encyclopedia back at your head.", StatChanges={LifeForce=-8, Happiness=-5}}}}
		}
	},
	{
		ID="Child_GreenBaby", MinAge=1, MaxAge=3, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="A tiny, green baby with a star-shaped birthmark crawls past you in the garden.",
		Options={
			{Text="Follow it", Outcomes={{Weight=10, ResultText="The closer you got, the smaller you felt. The logic of the universe shifts around you.", StatChanges={Bizarreness=8, Intelligence=5, Happiness=2}}}},
			{Text="Cry", Outcomes={{Weight=10, ResultText="It looked way too strange. You wailed until your parents picked you up.", StatChanges={Happiness=-5}}}}
		}
	},
	{
		ID="Child_Ladybug", MinAge=5, MaxAge=12, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You find a shiny, golden ladybug brooch buried in the dirt.",
		Options={
			{Text="Keep it for luck", Outcomes={{Weight=10, ResultText="You pinned it to your shirt. You feel a golden resolve welling up inside you.", StatChanges={Luck=10, Happiness=8, Bizarreness=3}}}},
			{Text="Leave it alone", Outcomes={{Weight=10, ResultText="You figured someone might be looking for it.", StatChanges={Intelligence=2}}}}
		}
	},
	{
		ID="Child_FangedBaby", MinAge=2, MaxAge=5, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="A baby in the playground has very sharp fangs and offers you a cup of weird concoction.",
		Options={
			{Text="Drink it", Outcomes={{Weight=10, ResultText="You instantly fell into a bizarre, carnival-themed nightmare.", StatChanges={LifeForce=-15, Happiness=-10, Bizarreness=6}}}},
			{Text="Smack the cup away", Outcomes={{Weight=10, ResultText="You slapped it out of his hands! The fanged baby looked shocked and angry.", StatChanges={Strength=4, Happiness=5, Intelligence=3}}}}
		}
	},
	{
		ID="Teen_LighterTest", MinAge=15, MaxAge=25, MinYear=1995, MaxYear=2005, IsBizarre=true,
		Text="A massive man in a prison cell hands you a lit lighter. 'Keep it burning for 24 hours,' he says.",
		Options={
			{Text="Protect the flame", Outcomes={{Weight=function(s) return s.Intelligence+s.Strength end, ResultText="You guarded it with your life. You passed the test.", StatChanges={Bizarreness=10, Happiness=10, Strength=5}}, {Weight=30, ResultText="The wind blew it out. You failed.", StatChanges={Happiness=-10}}}},
			{Text="Relight it when it dies", Outcomes={{Weight=10, ResultText="You flicked it back on, but the shadows in the room suddenly came alive and attacked you!", StatChanges={LifeForce=-25, Bizarreness=12, Happiness=-15}}}}
		}
	},
	{
		ID="Teen_LotteryTicket", MinAge=13, MaxAge=22, MinYear=1990, MaxYear=9999, IsBizarre=true,
		Text="You notice a discarded lottery ticket on the ground with the winning numbers!",
		Options={
			{Text="Cash it in", Outcomes={{Weight=10, ResultText="You claimed the massive reward!", StatChanges={Money=5000, Happiness=20}}}},
			{Text="Wait", Outcomes={{Weight=10, ResultText="A short kid with spikes on his head claims it belongs to him and his friends.", StatChanges={Happiness=-5, Bizarreness=4}}}}
		}
	},
	{
		ID="Teen_RadioTower", MinAge=15, MaxAge=25, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You find an eccentric man living entirely self-sufficiently inside an abandoned electrical tower.",
		Options={
			{Text="Step inside to say hi", Outcomes={{Weight=10, ResultText="You walked in, but now an invisible force prevents you from leaving!", StatChanges={LifeForce=-20, Happiness=-20, Bizarreness=10}}}},
			{Text="Talk from outside", Outcomes={{Weight=10, ResultText="You had a fascinating conversation about surviving on bugs and rain.", StatChanges={Intelligence=5, Happiness=4, Bizarreness=5}}}}
		}
	},
	{
		ID="Teen_WeirdDisc", MinAge=16, MaxAge=25, MinYear=2000, MaxYear=2015, IsBizarre=true,
		Text="You find a weird, rubbery disc that looks like a CD but feels like a human memory.",
		Options={
			{Text="Push it into your head", Outcomes={{Weight=10, ResultText="It melted into your skull! You suddenly know how to play the accordion perfectly.", StatChanges={Intelligence=15, Bizarreness=12, Happiness=10}}}},
			{Text="Sell it to a pawn shop", Outcomes={{Weight=10, ResultText="They gave you five bucks for a 'weird coaster'.", StatChanges={Money=5, Happiness=-2}}}}
		}
	},
	{
		ID="Teen_BeetleFight", MinAge=14, MaxAge=22, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="A kid challenges you to a high-stakes stag beetle fight in the sweltering summer heat.",
		Options={
			{Text="Accept the challenge", Outcomes={{Weight=function(s) return s.Luck end, ResultText="Your beetle executed an incredible suplex! You won!", StatChanges={Money=100, Happiness=15, Bizarreness=5}}, {Weight=function(s) return 100-s.Luck+10 end, ResultText="Your beetle immediately ran away in fear.", StatChanges={Happiness=-10, Money=-20}}}},
			{Text="Decline", Outcomes={{Weight=10, ResultText="You left him to play with his bugs alone.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Teen_SoulGamer", MinAge=15, MaxAge=25, MinYear=1985, MaxYear=2000, IsBizarre=true,
		Text="An expert gamer challenges you to a baseball video game, betting his soul against yours.",
		Options={
			{Text="Outsmart him", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="You read his pitching patterns and hit a home run!", StatChanges={Happiness=20, Intelligence=8, Bizarreness=8}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="You lost badly. You feel a part of your soul slip away.", StatChanges={LifeForce=-30, Happiness=-25, Bizarreness=5}}}},
			{Text="Star Platinum: Play", IsAvailable=function(s) return s.Stand=="Star Platinum" end, Outcomes={{Weight=10, ResultText="Your Stand perfectly executed the button combos. You crushed him flawlessly.", StatChanges={Happiness=25, Bizarreness=10}}}},
			{Text="Refuse to play", Outcomes={{Weight=10, ResultText="You decided betting souls over a video game was a bad idea.", StatChanges={Intelligence=3, Happiness=2}}}}
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
		ID="Encounter13", MinAge=11, MaxAge=17, MinYear=1930, MaxYear=9999, IsBizarre=true,
		Text="You found a weird comic book that seems to predict things before they happen.",
		Options={
			{Text="Follow its instructions", Outcomes={{Weight=4, ResultText="You narrowly avoided a falling pot and found twenty dollars!", StatChanges={Happiness=12, Money=20, Bizarreness=4}}, {Weight=6, ResultText="You followed it blindly and walked straight into a telephone pole.", StatChanges={LifeForce=-10, Happiness=-8}}}},
			{Text="Study its art style", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="The bizarre art style inspired you. You feel creatively enriched.", StatChanges={Intelligence=8, Happiness=4}}, {Weight=20, ResultText="The distorted faces gave you a terrible headache.", StatChanges={LifeForce=-3, Happiness=-6}}}},
			{Text="Throw it away", Outcomes={{Weight=10, ResultText="You tossed it in the trash. Probably for the best.", StatChanges={Happiness=3}}}}
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
		ID="Adult_FortuneTeller", MinAge=18, MaxAge=999, MinYear=1980, MaxYear=9999, IsBizarre=true,
		Text="An odd fortune teller in an alleyway grabs your arm and predicts a terrible disaster.",
		Options={
			{Text="Pay her for a charm ($50)", IsAvailable=function(s) return s.Money>=50 end, Outcomes={{Weight=10, ResultText="You feel a sense of spiritual protection. You hope it wasn't a scam.", StatChanges={Money=-50, Luck=10, Happiness=5}}}},
			{Text="Ignore her warnings", Outcomes={{Weight=5, ResultText="You walked away. Nothing bad happened. What a scam.", StatChanges={Happiness=2}}, {Weight=5, ResultText="You tripped immediately after leaving the alley and lost your wallet.", StatChanges={LifeForce=-5, Money=-50, Luck=-5}}}}
		}
	},
	{
		ID="Adult_HandMan", MinAge=20, MaxAge=50, MinYear=1990, MaxYear=2010, IsBizarre=true,
		Text="A perfectly normal-looking businessman strikes up a conversation, but he keeps staring at your hands.",
		Options={
			{Text="Hide your hands", Outcomes={{Weight=10, ResultText="He lost interest immediately and politely walked away.", StatChanges={Intelligence=2, Happiness=2}}}},
			{Text="Show off your manicure", Outcomes={{Weight=10, ResultText="He smiled creepily. You narrowly avoided being exploded by a tiny, invisible bomb.", StatChanges={LifeForce=-15, Happiness=-15, Bizarreness=8}}}}
		}
	},
	{
		ID="Adult_AlienCrop", MinAge=18, MaxAge=40, MinYear=1995, MaxYear=9999, IsBizarre=true,
		Text="You find an elven-looking young man with strange ears passed out in a crop circle.",
		Options={
			{Text="Offer him a tissue", Outcomes={{Weight=10, ResultText="He thanked you, claimed he was an alien, and turned into a pair of dice.", StatChanges={Happiness=10, Bizarreness=15, Luck=5}}}},
			{Text="Call an ambulance", Outcomes={{Weight=10, ResultText="By the time they arrived, he had completely vanished. You feel crazy.", StatChanges={Happiness=-5, Bizarreness=5}}}}
		}
	},
	{
		ID="Adult_Mangaka", MinAge=18, MaxAge=40, MinYear=1990, MaxYear=9999, IsBizarre=true,
		Text="A famous manga artist demands to use your life experiences as material for his comic.",
		Options={
			{Text="Refuse aggressively", Outcomes={{Weight=10, ResultText="He scoffed and wrote 'I cannot attack Rohan Kishibe' on your forehead before leaving.", StatChanges={Happiness=-10, Bizarreness=10, Strength=-5}}}},
			{Text="Tell him a story", Outcomes={{Weight=10, ResultText="He furiously sketched your anecdote. He handed you a wad of cash and left.", StatChanges={Money=500, Happiness=15, Bizarreness=5}}}}
		}
	},
	{
		ID="Adult_BeautySalon", MinAge=18, MaxAge=60, MinYear=1990, MaxYear=9999, IsBizarre=true,
		Text="You visit a salon where the beautician claims she can change your fate by altering your face.",
		Options={
			{Text="Get the 'Love' package ($200)", IsAvailable=function(s) return s.Money>=200 end, Outcomes={{Weight=10, ResultText="Your face shifted entirely! You look gorgeous and feel incredibly lucky in love.", StatChanges={Money=-200, Happiness=25, Body=15, Luck=10}}}},
			{Text="Just a trim", Outcomes={{Weight=10, ResultText="She sighed and gave you a perfectly average haircut.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Adult_HighwayStar", MinAge=18, MaxAge=50, MinYear=1990, MaxYear=9999, IsBizarre=true,
		Text="While driving down a long tunnel, you realize a pair of disembodied feet is chasing your car at exactly 60 mph.",
		Options={
			{Text="Speed up to 80 mph", Outcomes={{Weight=5, ResultText="You lost them, but got a massive speeding ticket from a hidden camera.", StatChanges={Money=-250, Happiness=-5, Bizarreness=10}}, {Weight=5, ResultText="The feet caught up and drained your nutrients before vanishing!", StatChanges={LifeForce=-20, Body=-10, Happiness=-15}}}},
			{Text="Crazy Diamond: Fix the car", IsAvailable=function(s) return s.Stand=="Crazy Diamond" end, Outcomes={{Weight=10, ResultText="You restored a broken barrier, blocking the feet permanently!", StatChanges={Happiness=15, Bizarreness=5}}}}
		}
	},
	{
		ID="Adult_GhostAlley", MinAge=18, MaxAge=999, MinYear=0, MaxYear=9999, IsBizarre=true,
		Text="You accidentally wander into a strange alleyway that wasn't on the map. You feel a sudden urge to look behind you.",
		Options={
			{Text="Keep looking forward", Outcomes={{Weight=10, ResultText="You walked straight out the other side safely. You feel spiritually cleansed.", StatChanges={Happiness=10, LifeForce=5, Bizarreness=8}}}},
			{Text="Turn around", Outcomes={{Weight=10, ResultText="Countless ghostly hands grabbed you and dragged you into the abyss!", StatChanges={LifeForce=-999, Happiness=-100}}}}
		}
	},
	{
		ID="Adult_Zipper", MinAge=18, MaxAge=999, MinYear=1995, MaxYear=2005, IsBizarre=true,
		Text="You wake up to find a massive, functional metal zipper embedded directly into your chest.",
		Options={
			{Text="Unzip it", Outcomes={{Weight=10, ResultText="You unzipped yourself! Inside was a hidden stash of Italian lira and a terrifying sense of dread.", StatChanges={Money=300, Happiness=-10, Bizarreness=15, Body=-5}}}},
			{Text="Zip it back up tight", Outcomes={{Weight=10, ResultText="You closed it and put a shirt on. By noon, the zipper had vanished like a bad dream.", StatChanges={Happiness=5, Bizarreness=5}}}}
		}
	},
	{
		ID="Adult_MuseumArrow", MinAge=18, MaxAge=999, MinYear=2000, MaxYear=9999, IsBizarre=true,
		Text="While touring an Egyptian exhibit, a golden arrow on display suddenly flies off the wall towards you!",
		Options={
			{Text="Dodge it", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You perfectly rolled out of the way. The arrow shattered against the wall.", StatChanges={Happiness=10, Strength=2, Bizarreness=5}}, {Weight=function(s) return 100-s.Strength+20 end, ResultText="You tripped and the arrow grazed your arm. You feel terribly ill.", StatChanges={LifeForce=-15, Body=-10}}}},
			{Text="Let it hit you", IsAvailable=function(s) return s.Stand=="None" end, Outcomes={{Weight=function(s) return s.LifeForce end, ResultText="It pierced you! You didn't die, and now you can see strange spirits.", StatChanges={Stand="Star Platinum", Happiness=20, Bizarreness=15, LifeForce=10}}, {Weight=30, ResultText="Your body couldn't handle the virus. You collapsed in agony.", StatChanges={LifeForce=-30, Happiness=-20}}}}
		}
	},
	{
		ID="Adult_Turtles", MinAge=18, MaxAge=999, MinYear=2000, MaxYear=2005, IsBizarre=true,
		Text="You find a turtle with a key-shaped hole in its shell wandering around a train station.",
		Options={
			{Text="Put your house key in it", Outcomes={{Weight=10, ResultText="You got sucked directly inside the turtle! It's a fully furnished living room in here.", StatChanges={Happiness=15, Bizarreness=20, Intelligence=5}}}},
			{Text="Give it some lettuce", Outcomes={{Weight=10, ResultText="It ate the lettuce slowly. A sharply dressed man thanked you and picked it up.", StatChanges={Happiness=5, Bizarreness=2}}}}
		}
	}
}