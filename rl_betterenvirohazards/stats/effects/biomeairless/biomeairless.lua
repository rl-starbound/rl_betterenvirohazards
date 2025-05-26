require "/scripts/vec2.lua"

function init()
  -- Contrary to intuition, the purpose of this status effect is not to
  -- take air away from the player, or to harm the player for being in
  -- an airless environment. That happens as a property of the player's
  -- location in the world. Rather, all this status effect does is pop
  -- up a SAIL warning about the lack of air at the player's location.
  -- This warning pops up only once for as long as the player is in a
  -- region with this status effect, or unless the player equips and
  -- then unequips a breath protection device.

  -- In the base game implementation, when the game is started with the
  -- player already in a hazardous biome and wearing an appropriate EPP,
  -- the status effect initializes before the EPP. Furthermore, airless
  -- worlds take about a quarter of a second before breathable dungeons
  -- register. Both of these idiosyncrasies result in the status effect
  -- popping up a notification inappropriately. Waiting one second
  -- before beginning to apply the effect avoids this.
  self.skipTimer = 1

  -- In the base game implementation, this status effect is triggered
  -- when there is no air at entity.position(), which causes false
  -- positives when the player is standing in deep water but is not
  -- underwater. Use mouthPosition instead.
  self.mouthRelativePosition = status.statusProperty("mouthPosition") or {0, 0}
end

function update(dt)
  if self.skipTimer > 0 then
    self.skipTimer = self.skipTimer - dt
    return
  end

  if not world.breathable(vec2.add(entity.position(), self.mouthRelativePosition)) then
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "biomeairless", 1.5)
    script.setUpdateDelta(0)
  end
end
