import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ locals: { supabase }, params }) => {
	const { data: game, error } = await supabase
		.from('game')
		.select('...quiz(text, thinking_time, topic(text, question(text, answer(text, is_correct))))')
		.order('order', { referencedTable: 'quiz.topic' })
		.order('order', { referencedTable: 'quiz.topic.question' })
		.order('order', { referencedTable: 'quiz.topic.question.answer' })
		.eq('slug', params.slug)
		.eq('host_key', params.hostKey)
		.single();

	if (error) {
		console.error(error);
	}
	console.log(game);
	return { game: game ?? [] };
};
