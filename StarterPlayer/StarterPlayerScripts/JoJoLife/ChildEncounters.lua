-- @ScriptType: ModuleScript
return {
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
		ID="Encounter8", MinAge=6, MaxAge=10, MinYear=1880, MaxYear=9999,
		Text="Your dad is trying to teach you how to ride a bicycle without training wheels.",
		Options={
			{Text="Pedal as hard as you can", Outcomes={{Weight=function(s) return s.Strength end, ResultText="You caught your balance and rode all the way down the street!", StatChanges={Happiness=8, Strength=4}}, {Weight=function(s) return 100-s.Strength+20 end, ResultText="You completely lost control and crashed into a mailbox.", StatChanges={LifeForce=-10, Happiness=-6}}}},
			{Text="Refuse to let go", Outcomes={{Weight=10, ResultText="You stayed safe, but didn't learn anything new today.", StatChanges={Happiness=-3}}}}
		}
	}
}