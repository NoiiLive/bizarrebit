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
	},
	{
		ID="Adult_CollegeFinals", MinAge=18, MaxAge=24, MinYear=1950, MaxYear=9999,
		Text="It is finals week at the university and you have three massive papers due.",
		Options={
			{Text="Pull an all-nighter", Outcomes={{Weight=6, ResultText="You finished everything but feel like a zombie.", StatChanges={Intelligence=5, Happiness=-10, LifeForce=-5}}, {Weight=4, ResultText="You fell asleep at your desk and failed.", StatChanges={Happiness=-15, LifeForce=-2}}}},
			{Text="Pace yourself", Outcomes={{Weight=10, ResultText="You managed your time well and passed comfortably.", StatChanges={Intelligence=3, Happiness=2}}}}
		}
	},
	{
		ID="Adult_FirstApartment", MinAge=18, MaxAge=25, MinYear=1900, MaxYear=9999,
		Text="You are hunting for your very first apartment.",
		Options={
			{Text="Rent the cheap one ($500)", IsAvailable=function(s) return s.Money>=500 end, Outcomes={{Weight=5, ResultText="It has a terrible roach problem, but it's yours.", StatChanges={Money=-500, Happiness=-5, Body=-2}}, {Weight=5, ResultText="It's cozy and affordable!", StatChanges={Money=-500, Happiness=10}}}},
			{Text="Rent the luxury one ($2000)", IsAvailable=function(s) return s.Money>=2000 end, Outcomes={{Weight=10, ResultText="The amenities are incredible. You feel very successful.", StatChanges={Money=-2000, Happiness=20}}}},
			{Text="Stay with parents", Outcomes={{Weight=10, ResultText="You saved money, but lost some independence.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Adult_Speakeasy", MinAge=18, MaxAge=30, MinYear=1920, MaxYear=1933,
		Text="A friend invites you to a hidden speakeasy downtown.",
		Options={
			{Text="Go and enjoy the jazz", Outcomes={{Weight=8, ResultText="You danced all night and had a fantastic time.", StatChanges={Happiness=15, Body=2}}, {Weight=2, ResultText="The place was raided by police! You barely escaped.", StatChanges={Happiness=-10, LifeForce=-5}}}},
			{Text="Decline", Outcomes={{Weight=10, ResultText="You stayed home and avoided any trouble with the law.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Adult_DotCom", MinAge=18, MaxAge=35, MinYear=1995, MaxYear=2001,
		Text="Everyone is investing in a new 'internet' startup company.",
		Options={
			{Text="Invest heavily ($2000)", IsAvailable=function(s) return s.Money>=2000 end, Outcomes={{Weight=5, ResultText="You sold at the peak and made a massive profit!", StatChanges={Money=10000, Happiness=25}}, {Weight=5, ResultText="The bubble burst and you lost everything.", StatChanges={Money=-2000, Happiness=-20}}}},
			{Text="Ignore the fad", Outcomes={{Weight=10, ResultText="You kept your money safe in the bank.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Adult_Backpacking", MinAge=18, MaxAge=30, MinYear=1960, MaxYear=9999,
		Text="You have the opportunity to backpack across Europe for the summer.",
		Options={
			{Text="Go for it ($1500)", IsAvailable=function(s) return s.Money>=1500 end, Outcomes={{Weight=8, ResultText="You saw the world and expanded your horizons.", StatChanges={Money=-1500, Happiness=20, Intelligence=5}}, {Weight=2, ResultText="You got terribly sick in a hostel.", StatChanges={Money=-1500, Happiness=-10, LifeForce=-10}}}},
			{Text="Stay and work", Outcomes={{Weight=10, ResultText="You saved your money, but feel a bit boring.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Adult_FirstCar", MinAge=18, MaxAge=25, MinYear=1910, MaxYear=9999,
		Text="You need a vehicle to get around town.",
		Options={
			{Text="Buy a clunker ($800)", IsAvailable=function(s) return s.Money>=800 end, Outcomes={{Weight=4, ResultText="It breaks down every week.", StatChanges={Money=-800, Happiness=-5}}, {Weight=6, ResultText="It runs surprisingly well!", StatChanges={Money=-800, Happiness=10}}}},
			{Text="Take the bus", Outcomes={{Weight=10, ResultText="You saved money but commuting takes forever.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Adult_QuarterLife", MinAge=25, MaxAge=30, MinYear=0, MaxYear=9999,
		Text="You wake up feeling like you haven't accomplished anything meaningful yet.",
		Options={
			{Text="Start a new hobby", Outcomes={{Weight=10, ResultText="You started painting. It really cleared your mind.", StatChanges={Happiness=8, Intelligence=2}}}},
			{Text="Dwell on it", Outcomes={{Weight=10, ResultText="You stayed in bed all day feeling miserable.", StatChanges={Happiness=-15}}}}
		}
	},
	{
		ID="Adult_Disco", MinAge=18, MaxAge=30, MinYear=1970, MaxYear=1979,
		Text="The local club is hosting a massive roller-disco competition.",
		Options={
			{Text="Enter the contest", Outcomes={{Weight=function(s) return s.Body end, ResultText="Your moves were flawless! You took first place.", StatChanges={Happiness=15, Money=300, Body=2}}, {Weight=function(s) return 100-s.Body+20 end, ResultText="You slipped and twisted your ankle in front of everyone.", StatChanges={Happiness=-10, LifeForce=-5}}}},
			{Text="Watch from the bar", Outcomes={{Weight=10, ResultText="You enjoyed the music without risking injury.", StatChanges={Happiness=5}}}}
		}
	},
	{
		ID="Middle_SportsCar", MinAge=40, MaxAge=55, MinYear=1960, MaxYear=9999,
		Text="You feel a sudden, intense urge to buy a wildly impractical sports car.",
		Options={
			{Text="Buy it ($15000)", IsAvailable=function(s) return s.Money>=15000 end, Outcomes={{Weight=10, ResultText="You cruise down the highway feeling young again!", StatChanges={Money=-15000, Happiness=25}}}},
			{Text="Resist the urge", Outcomes={{Weight=10, ResultText="You made the financially responsible choice, but feel a bit sad.", StatChanges={Happiness=-5}}}}
		}
	},
	{
		ID="Middle_WallStreet", MinAge=40, MaxAge=60, MinYear=1980, MaxYear=1989,
		Text="A high-stress corporate firm offers you a massive promotion, but it requires 80-hour work weeks.",
		Options={
			{Text="Accept the job", Outcomes={{Weight=10, ResultText="You are making incredible money, but you are constantly exhausted.", StatChanges={Salary=15000, Happiness=-15, LifeForce=-10}}}},
			{Text="Decline", Outcomes={{Weight=10, ResultText="You valued your free time over corporate greed.", StatChanges={Happiness=5}}}}
		}
	},
	{
		ID="Middle_Reunion", MinAge=40, MaxAge=50, MinYear=0, MaxYear=9999,
		Text="You received an invitation to your high school reunion.",
		Options={
			{Text="Go and catch up", Outcomes={{Weight=7, ResultText="It was great seeing old friends!", StatChanges={Happiness=10}}, {Weight=3, ResultText="Your old bully mocked you the entire night.", StatChanges={Happiness=-10}}}},
			{Text="Throw the invite away", Outcomes={{Weight=10, ResultText="You left the past in the past.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Middle_RealEstate", MinAge=35, MaxAge=60, MinYear=1950, MaxYear=9999,
		Text="A local real estate agent suggests you buy a rental property.",
		Options={
			{Text="Buy it ($20000)", IsAvailable=function(s) return s.Money>=20000 end, Outcomes={{Weight=8, ResultText="The property values skyrocketed! You are making great passive income.", StatChanges={Money=-20000, Salary=2000, Happiness=15}}, {Weight=2, ResultText="The tenants destroyed the place and it cost a fortune to repair.", StatChanges={Money=-25000, Happiness=-15}}}},
			{Text="Pass on it", Outcomes={{Weight=10, ResultText="You didn't want the hassle of being a landlord.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Middle_FadDiet", MinAge=40, MaxAge=60, MinYear=1990, MaxYear=9999,
		Text="You read about a new fad diet that involves drinking nothing but cabbage juice.",
		Options={
			{Text="Try the diet", Outcomes={{Weight=2, ResultText="You feel surprisingly energetic and lost weight!", StatChanges={Body=10, Happiness=5}}, {Weight=8, ResultText="You became incredibly malnourished and miserable.", StatChanges={Body=-10, LifeForce=-5, Happiness=-10}}}},
			{Text="Stick to normal food", Outcomes={{Weight=10, ResultText="You enjoyed a nice, balanced meal instead.", StatChanges={Happiness=3}}}}
		}
	},
	{
		ID="Middle_Y2K", MinAge=30, MaxAge=60, MinYear=1999, MaxYear=2000,
		Text="The news claims that all computers will crash at midnight on New Year's Eve.",
		Options={
			{Text="Stockpile canned food ($500)", IsAvailable=function(s) return s.Money>=500 end, Outcomes={{Weight=10, ResultText="Midnight passed. Nothing happened. Now you just have a lot of beans.", StatChanges={Money=-500, Happiness=-5}}}},
			{Text="Party like it's 1999", Outcomes={{Weight=10, ResultText="You had an amazing New Year's Eve party!", StatChanges={Happiness=15}}}}
		}
	},
	{
		ID="Middle_HairLoss", MinAge=40, MaxAge=60, MinYear=0, MaxYear=9999,
		Text="You look in the mirror and notice your hair is significantly thinning.",
		Options={
			{Text="Shave it all off", Outcomes={{Weight=10, ResultText="You embraced the baldness and rock the new look.", StatChanges={Happiness=8}}}},
			{Text="Buy expensive treatments ($300)", IsAvailable=function(s) return s.Money>=300 end, Outcomes={{Weight=5, ResultText="It actually worked! Your hair looks great.", StatChanges={Money=-300, Happiness=10}}, {Weight=5, ResultText="It was snake oil. You lost your money and your hair.", StatChanges={Money=-300, Happiness=-8}}}}
		}
	},
	{
		ID="Middle_SportsSponsor", MinAge=40, MaxAge=60, MinYear=1950, MaxYear=9999,
		Text="A local youth baseball team asks you to sponsor their jerseys.",
		Options={
			{Text="Sponsor them ($400)", IsAvailable=function(s) return s.Money>=400 end, Outcomes={{Weight=10, ResultText="They won the championship! You feel very proud of the community.", StatChanges={Money=-400, Happiness=15}}}},
			{Text="Politely decline", Outcomes={{Weight=10, ResultText="You kept your money, but feel a bit stingy.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Elder_Retirement", MinAge=60, MaxAge=70, MinYear=0, MaxYear=9999,
		Text="Your coworkers throw you a surprise retirement party.",
		Options={
			{Text="Celebrate", Outcomes={{Weight=10, ResultText="You ate cake and felt appreciated for your years of work.", StatChanges={Happiness=15, Job="Retired", Salary=0}}}},
			{Text="Refuse to retire", Outcomes={{Weight=10, ResultText="You politely told them you aren't leaving yet.", StatChanges={Happiness=5}}}}
		}
	},
	{
		ID="Elder_FirstTV", MinAge=60, MaxAge=999, MinYear=1950, MaxYear=1959,
		Text="The local appliance store is selling the first household television sets.",
		Options={
			{Text="Buy one ($300)", IsAvailable=function(s) return s.Money>=300 end, Outcomes={{Weight=10, ResultText="You are amazed by the moving pictures in your living room!", StatChanges={Money=-300, Happiness=15, Intelligence=2}}}},
			{Text="Stick to the radio", Outcomes={{Weight=10, ResultText="You refuse to adopt this newfangled technology.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Elder_Bingo", MinAge=65, MaxAge=110, MinYear=1940, MaxYear=9999,
		Text="It is Thursday night, which means Bingo at the community center.",
		Options={
			{Text="Play a few cards", Outcomes={{Weight=3, ResultText="BINGO! You won the grand prize!", StatChanges={Happiness=15, Money=200}}, {Weight=7, ResultText="You didn't win, but you enjoyed chatting with friends.", StatChanges={Happiness=8}}}},
			{Text="Stay home", Outcomes={{Weight=10, ResultText="You watched TV and fell asleep early.", StatChanges={Happiness=2}}}}
		}
	},
	{
		ID="Elder_Memoir", MinAge=70, MaxAge=110, MinYear=0, MaxYear=9999,
		Text="You decide it's time to write down the story of your life.",
		Options={
			{Text="Write honestly", Outcomes={{Weight=function(s) return s.Intelligence end, ResultText="Your memoir became a local bestseller! People loved your stories.", StatChanges={Money=1000, Happiness=20, Intelligence=5}}, {Weight=function(s) return 100-s.Intelligence+20 end, ResultText="Nobody bought it, but it was nice to reminisce.", StatChanges={Happiness=5}}}},
			{Text="Abandon the project", Outcomes={{Weight=10, ResultText="You couldn't find the motivation to finish it.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Elder_Joints", MinAge=65, MaxAge=110, MinYear=0, MaxYear=9999,
		Text="A massive thunderstorm is rolling in, and your knees are aching terribly.",
		Options={
			{Text="Take pain medicine", Outcomes={{Weight=10, ResultText="The medicine helped ease the pain. Getting old is rough.", StatChanges={Happiness=3, LifeForce=2}}}},
			{Text="Tough it out", Outcomes={{Weight=10, ResultText="You spent the day miserable and bedridden.", StatChanges={Happiness=-8, LifeForce=-5}}}}
		}
	},
	{
		ID="Elder_Discount", MinAge=65, MaxAge=110, MinYear=1960, MaxYear=9999,
		Text="The cashier at the diner asks if you qualify for the senior discount.",
		Options={
			{Text="Accept the discount", Outcomes={{Weight=10, ResultText="You got a cheap meal, but it made you feel old.", StatChanges={Happiness=-2}}}},
			{Text="Get offended", Outcomes={{Weight=10, ResultText="You yelled at them that you are still young at heart!", StatChanges={Happiness=-5}}}}
		}
	},
	{
		ID="Elder_Lawn", MinAge=65, MaxAge=110, MinYear=1950, MaxYear=9999,
		Text="Neighborhood teenagers keep skateboarding across your freshly mowed lawn.",
		Options={
			{Text="Yell at them", Outcomes={{Weight=10, ResultText="You shook your fist and yelled. They skated away laughing.", StatChanges={Happiness=-5}}}},
			{Text="Turn on the sprinklers", Outcomes={{Weight=10, ResultText="They got soaked and won't be coming back anytime soon.", StatChanges={Happiness=10}}}}
		}
	},
	{
		ID="Elder_Cats", MinAge=60, MaxAge=110, MinYear=0, MaxYear=9999,
		Text="A stray cat had a litter of kittens on your porch.",
		Options={
			{Text="Adopt them all", Outcomes={{Weight=10, ResultText="Your house is chaotic, but you have so much fuzzy company.", StatChanges={Happiness=15, Money=-50}}}},
			{Text="Call a shelter", Outcomes={{Weight=10, ResultText="You made sure they went to a good home safely.", StatChanges={Happiness=5}}}}
		}
	},
	{
		ID="Ancient_Nostalgia", MinAge=100, MaxAge=999, MinYear=1980, MaxYear=9999,
		Text="You see a horse-drawn carriage in a movie and feel an intense wave of nostalgia.",
		Options={
			{Text="Sigh deeply", Outcomes={{Weight=10, ResultText="You remember the good old days when things were simpler.", StatChanges={Happiness=5}}}},
			{Text="Complain about modern cars", Outcomes={{Weight=10, ResultText="You ranted to a stranger about how loud engines are.", StatChanges={Happiness=-2}}}}
		}
	},
	{
		ID="Ancient_Building", MinAge=150, MaxAge=999, MinYear=0, MaxYear=9999,
		Text="The city is demolishing a historic building. You remember watching them build it.",
		Options={
			{Text="Watch it fall", Outcomes={{Weight=10, ResultText="You felt a strange melancholy watching time march forward.", StatChanges={Happiness=-5, Intelligence=3}}}},
			{Text="Protest the demolition", Outcomes={{Weight=10, ResultText="You tried to save it, but no one believed you were there for its construction.", StatChanges={Happiness=-8}}}}
		}
	},
	{
		ID="Ancient_Grandchild", MinAge=200, MaxAge=999, MinYear=0, MaxYear=9999,
		Text="A distant relative tracks you down, thinking you are your own great-grandchild.",
		Options={
			{Text="Play along", Outcomes={{Weight=10, ResultText="You spun a convincing lie. Living this long requires deception.", StatChanges={Intelligence=5, Happiness=5}}}},
			{Text="Tell the truth", Outcomes={{Weight=10, ResultText="They thought you were completely insane and left.", StatChanges={Happiness=-5}}}}
		}
	},
	{
		ID="Ancient_Antique", MinAge=100, MaxAge=999, MinYear=1990, MaxYear=9999,
		Text="You find a cheap pocket watch you bought a century ago in a drawer. It's now a priceless antique.",
		Options={
			{Text="Sell it", Outcomes={{Weight=10, ResultText="You sold it to a museum for a massive fortune!", StatChanges={Money=25000, Happiness=20}}}},
			{Text="Keep it", Outcomes={{Weight=10, ResultText="You polished it and kept it as a reminder of your incredibly long life.", StatChanges={Happiness=10}}}}
		}
	},
	{
		ID="Ancient_Cemetery", MinAge=200, MaxAge=999, MinYear=0, MaxYear=9999,
		Text="You visit the local cemetery, but realize you've run out of room for new fake gravestones for your past aliases.",
		Options={
			{Text="Move to a new city", Outcomes={{Weight=10, ResultText="You packed up and started a brand new life elsewhere.", StatChanges={Happiness=-5, Money=-1000}}}},
			{Text="Stop faking your deaths", Outcomes={{Weight=10, ResultText="You decided to just let people be suspicious.", StatChanges={Happiness=5}}}}
		}
	},
	{
		ID="Ancient_Sunscreen", MinAge=100, MaxAge=999, MinYear=1980, MaxYear=9999,
		IsAvailable=function(s) return s.Race=="Vampire" end,
		Text="You discover modern SPF 100 sunscreen at the pharmacy.",
		Options={
			{Text="Test it in the sun", Outcomes={{Weight=5, ResultText="It actually worked! You enjoyed a brief moment in the daylight.", StatChanges={Happiness=25, Body=5}}, {Weight=5, ResultText="It wore off too fast and you got severe, sizzling burns.", StatChanges={LifeForce=-25, Happiness=-15}}}},
			{Text="Don't risk it", Outcomes={{Weight=10, ResultText="You stayed safely in the shadows.", StatChanges={Happiness=2}}}}
		}
	}
}