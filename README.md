# Elector Counts Fealty Randomiser
- A mod for Total War: Warhammer 3
- Randomizes Elector Count Fealty at the start of an Empire campaign

# About
This mod for Total War: Warhammer 3 randomises the Fealty values of every applicable Elector Count at the start of an Empire campaign where the Fealty mechanic is present. In the vanilla game, this is when the player is Reikland (Karl Franz) or The Golden Order (Balthasar Gelt). This allows for a more fresh and dynamic experience across multiple ~~Karl Franz~~ Empire campaigns.

Having [Mod Configuration Tool](https://steamcommunity.com/sharedfiles/filedetails/?id=2927955021) enabled allows the player to customize the minimum and maximum randomised values (the default limits are 2 to 7).

# How To Install
Subscribe to the mod on the [Steam Workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=2981189943).

This mod is completely script-based and can safely be removed mid-campaign.

# Compatibility
This mod does not touch the vanilla `wh2_dlc13_empire_politics.lua` script but does rely on the global `EMPIRE_ELECTOR_COUNTS` table that is defined in that script. Hence, any mods that add/update factions while also updating `EMPIRE_ELECTOR_COUNTS` to account for their changes should be compatible.

Given that this mod is for Empire campaigns (and only those with the Elector Count Fealty mechanic), it should have absolutely no trouble with mods for all other races.

In general, this should be compatible most Empire overhaul mods as long as they do not modify how the Fealty system works. I do not use SFO nor Radious so I have no idea what interaction those mods will have with this.

I have personally tested and confirmed compatibility with the following mods:

- [Mixu's Legendary Lords](https://steamcommunity.com/workshop/filedetails/?id=2802810577) by Mixu
- [Solland: Faction Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2942896604) by graetor and freakpear
- [Sylvania: Faction Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2948339087) by graetor
- [Your New Empire](https://steamcommunity.com/sharedfiles/filedetails/?id=2894759552) by freakpear
- [Sigmar's Heirs, an Empire Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2890463744) by Xoudad
- [Marienburg: The Merchant Empire](https://steamcommunity.com/sharedfiles/filedetails/?id=2949216752) by Skeleton Crew Modding (SCM)
- [Empire Secessionists, Secede!](https://steamcommunity.com/sharedfiles/filedetails/?id=2874009018) by HKrul and Snek

# Credits and Appreciation
Created by [Hanter](https://steamcommunity.com/id/hanter-19/myworkshopfiles/?appid=1142710)

Many thanks to the folks at [Da Modding Den](https://discord.gg/moddingden) whose numerous resources and conversations helped me learn how to make and debug WH3 mods.

Special thanks to [freakpear](https://steamcommunity.com/id/freakpear/myworkshopfiles/?appid=1142710) whose tips helped me get started on modding for WH3, and whose Empire Overhaul mod [Your New Empire](https://steamcommunity.com/sharedfiles/filedetails/?id=2894759552) and [recommended Mod collection](https://steamcommunity.com/workshop/filedetails/?id=2880941519) inspired me to start a new heavily modded ~~Empire~~ Karl Franz campaign. This spurred me to finally start making my own mods.
