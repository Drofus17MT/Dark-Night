import { system, world } from "@minecraft/server";

/**
 * @description Funcion que hace una promesa para un delay el cual funciona con array y await.
 * @param {number} ticks La cantidad de tiempo que va a esperar.
 * @returns {number} Los ticks que se van a esperar.
 */
export function delay(ticks) {
  return new Promise((resolve) => system.runTimeout(resolve, ticks));
}

/**
 * @description Función la cual pone un sonido que se eligió y hace que se le escuche a los jugadores.
 * @param {string} soundId Sonido.
 * @param {number} pitch El tono del sonido.
 * @param {number} volume El volumen del sonido.
 */
export function playSoundForAll(soundId, pit, volu) {
  for (const player of world.getPlayers()) {
    try {
      player.playSound(soundId, { pitch: pit, volume: volu });
    } catch {
      try {
        player.playSound(soundId, pit, volu);
      } catch {}
    }
  }
}
