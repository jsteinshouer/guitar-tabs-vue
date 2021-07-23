<template>
	<v-container>
		<v-layout row justify-space-between wrap>
			<h1 class="headline mb-3">Buttons</h1>

			<div>
				<v-btn>Normal</v-btn>
				<v-btn color="primary">Primary</v-btn>
				<v-btn color="accent">Accent</v-btn>
				<v-btn color="success">Success</v-btn>
				<v-btn color="error">Error</v-btn>
				<v-btn color="warning">Warning</v-btn>
				<v-btn color="info">Info</v-btn>
				<v-btn disabled>Disabled</v-btn>
			</div>

			<h1 class="headline mb-3">Flat Buttons</h1>
			<div>
				<v-btn flat>Normal</v-btn>
				<v-btn flat color="primary">Primary</v-btn>
				<v-btn flat color="accent">Accent</v-btn>
				<v-btn flat color="success">Success</v-btn>
				<v-btn flat color="error">Error</v-btn>
				<v-btn flat color="warning">Warning</v-btn>
				<v-btn flat color="info">Info</v-btn>
				<v-btn flat disabled>Disabled</v-btn>
			</div>

			<v-toolbar>
				<v-toolbar-side-icon></v-toolbar-side-icon>
				<v-toolbar-title>Title</v-toolbar-title>
				<v-spacer></v-spacer>
				<v-toolbar-items class="hidden-sm-and-down">
					<v-btn flat>Link One</v-btn>
					<v-btn flat>Link Two</v-btn>
					<v-btn flat>Link Three</v-btn>
				</v-toolbar-items>
			</v-toolbar>

			<v-flex xs12 sm6 offset-sm3>
				<v-card>
					<v-card-media
						src="https://cdn.vuetifyjs.com/images/cards/desert.jpg"
						height="200px"
					></v-card-media>

					<v-card-title primary-title>
						<div>
							<h3 class="headline mb-0">Kangaroo Valley Safari</h3>
							<div>
								Located two hours south of Sydney in the <br />Southern
								Highlands of New South Wales, ...
							</div>
						</div>
					</v-card-title>

					<v-card-actions>
						<v-btn flat color="orange">Share</v-btn>
						<v-btn flat color="orange">Explore</v-btn>
					</v-card-actions>
				</v-card>
			</v-flex>
		</v-layout>
	</v-container>
</template>

<script>
export default {
	data: function () {
		return {
			colorTypes: [
				"primary",
				"secondary",
				"accent",
				"success",
				"info",
				"warning",
				"error",
			],
		};
	},
};
</script>

