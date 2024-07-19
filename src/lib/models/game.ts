import type { Question } from './question';
import type { Topic } from './topic';

export type Game = {
	text: string;
	topics?: Topic[];
	questions?: Question[];
};
