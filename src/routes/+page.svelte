<script lang="ts">
	import { fade, fly } from 'svelte/transition';
	import { onMount } from 'svelte';
	import kvizTextLogo from '$lib/images/kviz-text-logo.svg';

	let visible = false;
	onMount(() => {
		visible = true;
	});
</script>

{#if visible}
	<header class="flex flex-col items-center justify-center mt-44 px-2">
		<img
			class="max-w-full"
			transition:fly={{ y: -200, duration: 2000, delay: 0 }}
			src={kvizTextLogo}
			width="400"
			alt="KVIZ text logo that says kviz"
		/>
		<p
			class="text-2xl mt-2 text-white text-center"
			transition:fade={{ duration: 1000, delay: 200 }}
		>
			This is kviz. A quiz game app. More info coming soon.
		</p>
	</header>
{/if}

<style lang="postcss">
	:global(html) {
		background-color: theme(colors.gray.700);
	}
</style>
