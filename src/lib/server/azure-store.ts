import { env } from '$env/dynamic/private';
import type { Game } from '$lib/models/game';
import type { GameEntity } from '$lib/models/game-entity';
import { TableClient } from '@azure/data-tables';

export const fetchGameByHostHey = async (hostKey: string): Promise<Game> => {
	if (!env.DatabaseConnectionString || !env.GamesTableName || !env.Username) {
		throw new Error('Missing stuff from environment');
	}

	const tableClient = TableClient.fromConnectionString(
		env.DatabaseConnectionString,
		env.GamesTableName
	);
	try {
		// TODO: Get username from authenticated user
		const gameEntity = await tableClient.getEntity<GameEntity>(env.Username, hostKey);
		console.log(gameEntity);

		const game: Game = JSON.parse(gameEntity.Content);

		return game;
		// eslint-disable-next-line @typescript-eslint/no-explicit-any
	} catch (error: any) {
		// TODO: Give better error messages
		if (error?.message.includes('ResourceNotFound')) {
			throw error;
		} else {
			throw error;
		}
	}
};
