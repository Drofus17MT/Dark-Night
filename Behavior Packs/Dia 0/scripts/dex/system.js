import { world } from '@minecraft/server';

const CONFIG = {
	DIMENSIONS: {
		'minecraft:overworld': '§aOverworld§r',
		'minecraft:nether': '§mNether§r',
		'minecraft:the_end': '§dThe End§r'
	}
}

const Utlis = {
	delay: (ticks) => new Promise(resolve => system.runInterval(resolve, ticks))
}

world.afterEvents.entityDie.subscribe(async (event) => {
	const { deadEntity } = event;
	const { x, y, z } = deadEntity.location;

	if (!deadEntity || deadEntity !== 'minecraft:player') {
		world.sendMessage({
			translate: "text.death",
			with: { rawtext: [{ text: `${deadEntity.nameTag}` }] }
		})
	}
})