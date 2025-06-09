# Starbound mod: Better Environment Hazards

The environment hazards in the base game ([Deadly Radiation](https://starbounder.org/Deadly_Radiation), [Deadly Chill](https://starbounder.org/Deadly_Chill), and [Deadly Heat](https://starbounder.org/Deadly_Heat)) are somewhat imbalanced, with Deadly Heat in many cases being easier to survive than Deadly Radiation or Deadly Chill. This mod rebalances them:
* Deadly Radiation now caps the player's max health at 25%, not 15%.
* Deadly Chill now does 10 DPS after the player's energy is drained, instead of 15 DPS.
* Deadly Heat now does 15 DPS at all times, regardless of whether the player is touching the ground.

It also corrects a condition in which environment hazards could be applied to the player before the blocking stats of an EPP are applied, which causes damage to be applied inappropriately. Now, each of these environment hazards (and also the airless status effect) wait 1 second before they begin to apply their effects to the player, giving time for applicable blocking stats to be applied.

Additionally, the airless status effect now checks whether the airless region includes the player's mouth, rather than the center of their chest, before applying its effect.

Finally, a bug was fixed with mechs involving environment hazards. In the base game, mechs prevent environment hazards from affecting their pilots as long as they remain in the mech. However, if the player exits the mech and is affected by an environment hazard, and then re-enters the mech, the hazard continues to affect the player. This can be observed most easily on Tier 5 planets affected by Deadly Chill, but it happens with all of the environment hazards except airlessness. This mod fixes mechs so that they always protect their pilot from all base game environment hazards.

## Compatibility

As this is considered a "bugfix" mod, it has an early-loading priority, so other mods that alter the environment hazards may override it.
* Frackin Universe replaces the airlessness code, but its replacement is effectively identical to this mod's airlessness.
* Starburst Rework replaces all four base game environment hazards, so the only effect this mod has, when used with Starburst Rework, is the mech pilot immunity fix.

This mod does not alter any non-base game environment hazards. Mod authors of those hazards should modify their code to behave similarly to this mod, to avoid similar bugs with their mods' hazards.

## Uninstallation

This mod should be safe to be freely installed or uninstalled without problems.

## Collaboration

If you have any questions, bug reports, or ideas for improvement, please contact me via [Chucklefish Forums](https://community.playstarbound.com/members/rl-starbound.885402/), [Github](https://github.com/rl-starbound), [Reddit](https://www.reddit.com/user/rl-starbound/), or Discord (rl.steam). Also please let me know if you plan to republish this mod elsewhere, so we can maintain open lines of communication to ensure timely updates.

## License

Permission to include this mod or parts thereof in derived works, to distribute copies of this mod verbatim, or to distribute modified copies of this mod, is granted unconditionally to Chucklefish LTD. Such permissions are also granted to other parties automatically, provided the following conditions are met:
* Credit is given to the author(s) specified in this mod's `_metadata` file;
* A link is provided to the [Chucklefish Forum page](https://community.playstarbound.com/resources/better-environment-hazards.6363/) or the [source repository](https://github.com/rl-starbound/rl_betterenvirohazards) in the accompanying files or documentation of any derived work;
* The names "Better Environment Hazards" and "rl_betterenvirohazards" are not used as the metadata friendlyName and name, respectively, of any derived mod without explicit consent of the author(s); however, the name may be used in verbatim distribution of this mod. For the purposes of this clause, minimal changes to metadata files to allow distribution on Steam shall be considered a verbatim distribution so long as authorship attribution remains.
