function init()
  animator.setParticleEmitterOffsetRegion("snow", mcontroller.boundBox())
  animator.setParticleEmitterActive("snow", true)

  effect.setParentDirectives(config.getParameter("directives", ""))

  self.movementModifiers = config.getParameter("movementModifiers", {})

  self.energyCost = config.getParameter("energyCost", 1)
  self.healthDamage = config.getParameter("healthDamage", 1)

  effect.addStatModifierGroup({{stat = "energyRegenPercentageRate", effectiveMultiplier = 0}})

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
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "biomecold", 1.5)
    self.played = true
  end
  mcontroller.controlModifiers(self.movementModifiers)
  if not status.overConsumeResource("energy", self.energyCost) then
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = self.healthDamage,
        damageSourceKind = "ice",
        sourceEntityId = entity.id()
      })
  end
end
