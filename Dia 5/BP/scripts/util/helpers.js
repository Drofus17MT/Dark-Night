import { system, world } from "@minecraft/server";

/**
 * @description Genera un numero al azar de min al max.
 * @param {number} min Numero minimo
 * @param {number} max Numero maximo
 * @return Devuelve el numeor aleatorio entre el min y el max
 */
export function randomMinMax(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

/**
 * @description Funcion que elige una variante de forma random.
 * @param {Array} variant Lista de variantes.
 * @returns {string} Elemento aleatorio del array.
 */
export function randomVariant(variant) {
  return variant[Math.floor(Math.random() * variant.length)];
}

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

export function particleForAll(particle, loca) {
  for (const player of world.getPlayers()) {
    try {
      // spawnParticle usually takes (particleName, location, options?)
      player.dimension.spawnParticle(particle, loca);
    } catch {
      // Some runtimes expect the particle name as a string template
      try {
        player.dimension.spawnParticle(`${particle}`, loca);
      } catch {}
    }
  }
}
