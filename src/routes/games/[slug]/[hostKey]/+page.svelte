<script>
	import Question from '$lib/Question.svelte';

	import { onMount } from 'svelte';
	let visible = false;
	onMount(() => {
		visible = true;
	});

	export let data;
	console.log('game', data.game);

	let questions = [];
	let showQuestionModal = false;
	let showCorrect = false;
	let currentQuestion = null;

	// const letters = ['A', 'B', 'C', 'D', 'E'];
	const letters = ['1', '2', '3', '4', '5'];
	const points = ['1p', '1p', '2p', '2p', '3p'];
	for (let i = 0; i < 5; i++) {
		for (const topic of data.game.topic) {
			if (topic.question && i < topic.question.length) {
				const tempText = letters[i];
				let pointsText = points[i];
				questions.push({ tempText, pointsText, isShown: false, question: topic.question[i] });
			}
		}
	}

	let counter = 0;
	// currentQuestion = questions[counter];
	// showQuestionModal = true;
	// setInterval(() => {
	// 	counter++;
	// 	currentQuestion = questions[counter];
	// }, 2000);

	function showQuestion(question) {
		console.log('showQuestion', question);
		showCorrect = false;
		question.isShown = true;
		currentQuestion = question;
		questions = questions.map((q) => (q === question ? { ...q, isShown: true } : q));
		showQuestionModal = true;
	}
</script>

<div class="flex justify-center min-h-screen bg-pink-200">
	<div class="w-full max-w-[1000px] p-5 mt-10">
		<h1 class="mb-3 text-center text-2xl">
			{data.game.text}
		</h1>
		<div class="grid grid-cols-5 gap-5">
			{#each data.game.topic as topic}
				<div
					class="bg-blue-500 px-1 py-2 flex justify-center items-center text-center text-white text-xl rounded-xl"
				>
					{topic.text}
				</div>
			{/each}
			{#each questions as question}
				<button
					class="bg-blue-200 px-1 py-2 h-28 text-5xl flex flex-col justify-center items-center text-center hover:bg-blue-100 relative rounded-xl"
					class:opacity-20={question.isShown}
					on:click={() => showQuestion(question)}
				>
					<div class="text-xl px-2 py-1 rounded-full bg-pink-500 text-white absolute top-2 right-2">
						{question.pointsText}
					</div>
					<div>{question.tempText}</div>
				</button>
			{/each}
		</div>
	</div>
</div>

<Question bind:isOpen={showQuestionModal}>
	{#if currentQuestion}
		<button on:click={() => (showCorrect = true)} class="text-2xl"
			>{currentQuestion.question.text}</button
		>
		<div class="grid grid-cols-4 gap-5 pt-8">
			<div
				class="bg-green-300 text-center px-2 py-1 text-xl outline-green-600"
				class:outline-dashed={showCorrect && currentQuestion.question.answer[0].is_correct}
			>
				<span class="">a)</span>
				{currentQuestion.question.answer[0].text}
			</div>
			<div
				class="bg-red-300 text-center px-2 py-1 text-xl outline-green-600"
				class:outline-dashed={showCorrect && currentQuestion.question.answer[1].is_correct}
			>
				<span class="">b)</span>
				{currentQuestion.question.answer[1].text}
			</div>
			<div
				class="bg-blue-300 text-center px-2 py-1 text-xl outline-green-600"
				class:outline-dashed={showCorrect && currentQuestion.question.answer[2].is_correct}
			>
				<span class="">c)</span>
				{currentQuestion.question.answer[2].text}
			</div>
			<div
				class="bg-yellow-300 text-center px-2 py-1 text-xl outline-green-600"
				class:outline-dashed={showCorrect && currentQuestion.question.answer[3].is_correct}
			>
				<span class="">d)</span>
				{currentQuestion.question.answer[3].text}
			</div>
		</div>
	{/if}
</Question>
