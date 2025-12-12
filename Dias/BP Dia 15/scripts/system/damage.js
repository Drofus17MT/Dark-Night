import { Player, world } from "@minecraft/server";
import { MELEE_HANDLERS } from "../config/effects";

world.afterEvents.entityHitEntity.subscribe((event) => {
  const { hitEntity, damagingEntity } = event;

  if (hitEntity === Player) return;

  const variant = damagingEntity.getComponent("variant");
  const handel = MELEE_HANDLERS[damagingEntity?.typeId];

  if (handel) return handel(hitEntity, variant);
});
