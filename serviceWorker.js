var CACHE_NAME = 'SEROFCA'
var urlsToCache = [
	'/',
	'/styles/inline.css',
	'/images/ic_add_white_24px.svg',
	'/images/ic_refresh_white_24px.svg',
	'/images/lpng.png',
	'/scripts/app.js'
]

self.addEventListener('install', function(event) {
	// Perform install steps
	event.waitUntil(
		caches.open(CACHE_NAME)
			.then(function(cache) {
				console.log('Opened cache')
				return cache.addAll(urlsToCache)
			})
	);
});

self.addEventListener('fetch', function(event) {
	console.log(event)
	event.respondWith(
		caches.match(event.request)
			.then(function(response) {
				// Cache hit - return response
				if (response) {
					console.log('cache hit')
					return response
				}
				if (navigator.onLine) {
					console.log('online')
				}else{
					console.log('offline')
				}
				console.log('cache miss')
				// IMPORTANT: Clone the request. A request is a stream and
				// can only be consumed once. Since we are consuming this
				// once by cache and once by the browser for fetch, we need
				// to clone the response.
				var fetchRequest = event.request.clone()

				return fetch(fetchRequest).then(
					function(response) {
						// Check if we received a valid response
						if(!response || response.status !== 200 || response.type !== 'basic') {
							console.error('error in response')
							return response
						}
						// IMPORTANT: Clone the response. A response is a stream
						// and because we want the browser to consume the response
						// as well as the cache consuming the response, we need
						// to clone it so we have two streams.
						var responseToCache = response.clone()
						caches.open(CACHE_NAME)
							.then(function(cache) {
								cache.put(event.request, responseToCache)
							})
						return response
					}
				)
			})
		)
})
