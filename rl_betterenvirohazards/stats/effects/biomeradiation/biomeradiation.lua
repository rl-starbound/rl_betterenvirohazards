function init()
  effect.setParentDirectives(config.getParameter("directives", ""))
  self.healthPercentage = config.getParameter("healthPercentage", 0.1)

  self.played = false

  -- In the base game implementation, when the game is started with the
  -- player already in a hazardous biome and wearing an appropriate EPP,
  -- the status effect initializes before the EPP, which results in the
  -- status effect impacting the player inappropriately. Waiting one
  -- second before beginning to apply the effect avoids this.
  self.skipTimer = 1
end

function update(dt)
  if self.skipTimer > 0 then
    self.skipTimer = self.skipTimer - dt
    return
  end

  if not self.played then
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "biomeradiation", 1.5)
    self.played = true
  end
  status.setResourcePercentage("health", math.min(status.resourcePercentage("health"), self.healthPercentage))
end
