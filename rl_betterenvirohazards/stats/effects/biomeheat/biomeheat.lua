function init()
  local bounds = mcontroller.boundBox()
  animator.setParticleEmitterBurstCount("flames", 6)
  animator.setParticleEmitterOffsetRegion("flames", {bounds[1], bounds[2] - 0.25, bounds[3], bounds[2] + 0.25})
  animator.setParticleEmitterOffsetRegion("drips", bounds)
  animator.setParticleEmitterActive("drips", true)

  self.tickDamage = config.getParameter("tickDamage")

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
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "biomeheat", 1.5)
    self.played = true
  end
  if mcontroller.onGround() then
    animator.burstParticleEmitter("flames")
  end
  status.applySelfDamageRequest({
      damageType = "IgnoresDef",
      damage = self.tickDamage,
      damageSourceKind = "fire",
      sourceEntityId = entity.id()
    })
end
