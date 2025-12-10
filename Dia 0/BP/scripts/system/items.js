import { EquipmentSlot, world } from "@minecraft/server";

world.afterEvents.itemUse.subscribe(async (itemUse) => {
  try {
    const { itemStack, source } = itemUse;
    if (!itemStack.typeId === "minecraft:totem_of_undying") return;
    const equippable = source.getComponent("equippable");
    const inventory = source.getComponent("inventory")?.container;
    const slot = source.selectedSlotIndex;
    const offHand = equippable?.getEquipment(EquipmentSlot.Offhand);

    await null;

    equippable.setEquipment(EquipmentSlot.Offhand, itemStack);
    inventory.setItem(slot, offHand ?? undefined);
  } catch {}
});
