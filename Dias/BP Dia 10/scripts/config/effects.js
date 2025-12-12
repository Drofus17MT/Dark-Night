export const effects = {
  fillBlocks: (entity, positions, blockType) => {
    positions.forEach((pos) => {
      entity.runCommand(`fill ${pos} ${blockType}`);
    });
  },
};

export const MELEE_HANDLERS = {
  "minecraft:cave_spider": (hitEntity) => {
    effects.fillBlocks(hitEntity, ["~~~ ~~1~"], "web");
  },
  "minecraft:spider": (hitEntity) => {
    effects.fillBlocks(hitEntity, ["~~~ ~~1~"], "web");
  },
};
