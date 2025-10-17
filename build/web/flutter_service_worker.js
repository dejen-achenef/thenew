'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1826e25e12b19053bd9a3e7b1ad8688a",
"assets/AssetManifest.bin.json": "a514bab1fc5da84869a34d60a2c9237b",
"assets/AssetManifest.json": "61780142f3b7d5906eedddf29b870851",
"assets/assets/images/2e3bf33dd29c796ce504fd6389e8cb7c.jpg": "748597e5eebf35d142b8bf7f3142e365",
"assets/assets/images/amazonLogo.jpg": "ad0b091e6651c1031ca6f501b3b665b4",
"assets/assets/images/apple-touch-icon.png": "8379572b85036c82e041589cee6d943f",
"assets/assets/images/chat_app.png": "5c95561e14048ed6ae9d820a34f81310",
"assets/assets/images/dashbord.png": "e07e48579867f6f0d71c4d6de1fe83c2",
"assets/assets/images/dejen-CV.pdf": "6295152fd915cb79e7af87f991d7217c",
"assets/assets/images/dejen.png": "3b0c64c55030aec42e0a60cd94a31565",
"assets/assets/images/dtech_marketplace.png": "b1ab2dbd2f0deb1f22403e2a2744d5b8",
"assets/assets/images/favicon%2520(1).ico": "e5b5cfa045860d03125bf7cff8e4ebd6",
"assets/assets/images/favicon%2520(2).ico": "971af6a3c0811132d0478d6b76d98ef2",
"assets/assets/images/favicon.ico": "e78b371c1284a6759705ad24bb2e4961",
"assets/assets/images/hero-img.jpg": "b28baa8958365c46aad2dde5d06371eb",
"assets/assets/images/homebackground.jpg": "0ec7bce652cf91bdde408263731de6d2",
"assets/assets/images/homebgi2.jpg": "5b31f75ba120bee48826db418fbced2d",
"assets/assets/images/logo.png": "714e3674dcf4595ce4ae552f21ec07f1",
"assets/assets/images/netflixLogo.jpg": "fc4812f8a7838e9acacdfe35669fac9c",
"assets/assets/images/nike_e_commerce.png": "ff4915effcce0a95d4aa53a7e7a14f2f",
"assets/assets/images/portfolio/abegarage.png": "a7d3e30be9ed6d54305e458152794d77",
"assets/assets/images/portfolio/app-1.jpg": "8665e799dd54e5f0b7b33a373ccbf8e7",
"assets/assets/images/portfolio/app-2.jpg": "2accb7cf1be3260653be6ed981596d68",
"assets/assets/images/portfolio/app-3.jpg": "e9985a722446bf8df8ba3c859e6897b1",
"assets/assets/images/portfolio/apple-bootstrap.jpeg": "7210e896e45410276c0431a8246b72dd",
"assets/assets/images/portfolio/appleLogo.jpg": "d22e386b7aa2bcf787a7486c129c4a6b",
"assets/assets/images/portfolio/books-1.jpg": "fa77ff5b5927ac2192237fa457dddbec",
"assets/assets/images/portfolio/books-2.jpg": "b4a9fc4bc81357374b0effce7339e7d0",
"assets/assets/images/portfolio/books-3.jpg": "358a6f1a52e6ab7bd5f988499e37e0ce",
"assets/assets/images/portfolio/branding-1.jpg": "784653cb6e71a04c898070e4c5a0f801",
"assets/assets/images/portfolio/branding-2.jpg": "401230dc5f6d69c1d9bb38a0ef92dd87",
"assets/assets/images/portfolio/branding-3.jpg": "2679babfb64cecdac8a4af3786727ebb",
"assets/assets/images/portfolio/evangadiForumLogo.jpg": "d46e2a5eb07709e3e2d57a2e22f7a9ad",
"assets/assets/images/portfolio/gechPhoto.jpg": "1a5d0fa828044ad183d1cd7c71da0822",
"assets/assets/images/portfolio/gechPhoto.png": "fec39b0365b9f9eef6756c0034514430",
"assets/assets/images/portfolio/product-1.jpg": "0eeac7e89d80d6da6a5beaff482507de",
"assets/assets/images/portfolio/product-2.jpg": "0f93e567fa767516515df375317f1b71",
"assets/assets/images/portfolio/product-3.jpg": "4ae7ac139e8c43e976d53fdfa9011647",
"assets/assets/images/profile-img.jpg": "7e6b0d6daf75e598fdbf2197176828b1",
"assets/assets/images/rent.png": "4bd5892ca6273ba7b84f495a2f2d351d",
"assets/assets/images/services.jpg": "5f5490c67344531f72d7577f16907a4d",
"assets/assets/images/Skills/bootstrap.png": "854e259414e0467249c5d33dbd6465d6",
"assets/assets/images/Skills/css.png": "81dfa7c2b8a668212f09880e608a4cfe",
"assets/assets/images/Skills/express.png": "d6579263ea4bad53479724334227f852",
"assets/assets/images/Skills/firebase.png": "cf0918b3d77d6e4505a65f103e5f3382",
"assets/assets/images/Skills/git.png": "ce22b41553852ceb6e48db7fbe732ce1",
"assets/assets/images/Skills/html.png": "a91a86b60a550d5c55efba6354b0335e",
"assets/assets/images/Skills/mysql.png": "a41f2061186139958ff5624173c3594a",
"assets/assets/images/Skills/newgit.png": "18605eb4352364103fcc95ee2a346fbb",
"assets/assets/images/Skills/nodejs.png": "c29d363fd838aecec95fa6a0c8b89039",
"assets/assets/images/Skills/react.png": "1bf9e36a76d7c9c41691fb26026caf55",
"assets/assets/images/stats-bg.jpg": "fd1eda48b1f2617e6985c0812c73a4a4",
"assets/assets/images/testimonials/testimonials-1.jpg": "2eb96321ab48d0ba8c87de31ad7087fe",
"assets/assets/images/testimonials/testimonials-2.jpg": "b6d1701868336600a333ea7bec662425",
"assets/assets/images/testimonials/testimonials-3.jpg": "3d677828b23ca5dc9653eb9e8f92aa1f",
"assets/assets/images/testimonials/testimonials-4.jpg": "08d8679b1e421ad63fd4d61156a5acd1",
"assets/assets/images/testimonials/testimonials-5.jpg": "72fb04435870ed091240bd9da7474dab",
"assets/assets/images/testimonials-bg.jpg": "413694a5b50d0f5b2856afeda0aab895",
"assets/assets/images/tutor.png": "a1896c2eb1b1b681a6a93efbb8ac828a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1bd5fee911c1bdc393a3138b22952d71",
"assets/NOTICES": "0d7e3515a103631aa4de6edfe41480dd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "5a68cf625fafc6aa8c8531fbcaed8e9f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a2deff23a3893dad4ec2356f58362cef",
"/": "a2deff23a3893dad4ec2356f58362cef",
"main.dart.js": "cc361bb35767786ea1321dce29d05654",
"manifest.json": "75ddf561701309cd388dc71fbe615148",
"version.json": "7804eb643eb875d188221832d4ff86c5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
