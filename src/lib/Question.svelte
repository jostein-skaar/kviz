<script lang="ts">
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
	<div class="fixed inset-0 bg-black bg-opacity-80 z-50 flex justify-center items-start pt-40">
		<div class="bg-white p-8 rounded-lg shadow-lg w-[800px]">
			<button class="absolute top-0 right-0 p-4 text-xl" on:click={closeModal}>×</button>
			<slot></slot>
		</div>
	</div>
{/if}
