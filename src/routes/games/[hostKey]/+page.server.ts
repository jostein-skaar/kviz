import { fetchGameByHostHey } from '$lib/server/azure-store';
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ params }) => {
	const game = await fetchGameByHostHey(params.hostKey);
	console.log('game on server', game);
	return { game: game ?? [] };
};
