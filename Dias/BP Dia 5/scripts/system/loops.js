import { world } from "@minecraft/server";
import { delay, playSoundForAll } from "../util/helpers";

world.afterEvents.playerSpawn.subscribe(async (pS) => {
  try {
    let player = pS.player;
    if (player.hasTag("in")) return;

    await delay(40);

    playSoundForAll("item.trident.thunder", 1, 100);
    player.runCommand(`give @s totem_of_undying 2`);
    player.runCommand(`give @s bread 16`);
    player.addTag("in");
  } catch {}
});

world.afterEvents.worldLoad.subscribe(() => {
  try {
    world.gameRules.showCoordinates = true;
    world.gameRules.commandBlockOutput = true;
    world.gameRules.sendCommandFeedback = true;
    world.gameRules.doImmediateRespawn = true;
  } catch {}
});
