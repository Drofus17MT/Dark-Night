import { world, EquipmentSlot } from '@minecraft/server';

world.beforeEvents.itemUse.subscribe(async (event) => {
	try {
		const { itemStack, source } = event;
		if (itemStack === 'minecraft:totem_of_undying' && offHand == undefined) {
			const equippable = source.getComponent('equippable');
			const inventory = source.getComponent('inventory')?.container;
			const slots = source.selectedSlotIndex;
			const offHand = equippable?.getEquipment(EquipmentSlot.Offhand);
			
			await null;

			equippable.setEquipment(EquipmentSlot.Offhand, itemStack);
			inventory.setItem(slots, offHand ?? undefined)
		}
	} catch { };
});