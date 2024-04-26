<script lang="ts">
	import { fade, fly } from 'svelte/transition';

	export let isOpen = false;
	export function closeModal() {
		isOpen = false;
	}

	function onKeyDown(event: KeyboardEvent) {
		// console.log(event);
		if (event.code === 'Escape') {
			closeModal();
		}
	}
</script>

<svelte:window on:keydown={onKeyDown} />

{#if isOpen}
	<div
		class="fixed inset-0 bg-black bg-opacity-80 z-50 flex justify-center items-start pt-40"
		in:fade={{ duration: 300 }}
		out:fade={{ duration: 300, delay: 100 }}
	>
		<div
			class="bg-white p-8 rounded-lg shadow-lg w-[800px]"
			in:fly={{ y: 300, delay: 300, duration: 800 }}
			out:fly={{ y: 300, duration: 300 }}
		>
			<button class="absolute top-0 right-0 p-4 text-xl" on:click={closeModal}>×</button>
			<slot></slot>
		</div>
	</div>
{/if}
