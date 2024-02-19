'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "af2abd1f933475059c4b631c27cd8519",
"manifest.json": "410b29f7c8f1811116da909b4148e693",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"index.html": "f2ada1af54a7676ea0376c172ccde4c4",
"/": "f2ada1af54a7676ea0376c172ccde4c4",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "106816a64fe78ec4fc2584da89077c28",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/AssetManifest.bin": "892c2b7574899e56b691f3bb727c5159",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "d976ff7985cad323318421c3f629e944",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2429271c3e4917d9cc068c22bc02522f",
"assets/AssetManifest.bin.json": "57fd6b38ba1976715ec10c8e5a0320dd",
"assets/NOTICES": "143afad918c8d5281f57839103f2a0ea",
"assets/asset/clockhealth.gif": "ea1b70e88c94a263f56a2dfd9b9dbbe3",
"assets/asset/giphy.gif": "617eea9cf9ccb37d476442590b577d6a",
"assets/asset/workout5.jpg": "984d5d8ec6c09ff83a6a2362fc4f1436",
"assets/asset/muscle_map/female_biceps.jpg": "f50af0b4146c0c44c4b74a54c669b5e3",
"assets/asset/muscle_map/female_chest.jpg": "c361ea8fe52b26339fbd2726f815a48d",
"assets/asset/muscle_map/female_abs.jpg": "04a1638274f477e5a02e2a275c16a07d",
"assets/asset/muscle_map/female.jpg": "d252e93ee540a7b634e0d9d5fab34903",
"assets/asset/muscle_map/male_thighs.jpg": "5839567950a71e54ba74e11be6b04160",
"assets/asset/muscle_map/female_back.jpg": "d4d1c3b8ea233799030c14152f449adf",
"assets/asset/muscle_map/male_chest.jpg": "d140f31d6a78f3c68df26d1d7173d389",
"assets/asset/muscle_map/female_back2.jpg": "067ecc70cb2bf6758b53cd4f83a48370",
"assets/asset/muscle_map/female_thighs.jpg": "49abbbfee6f0729da8080437be911e56",
"assets/asset/muscle_map/male.jpg": "c2eef89dcd9ca406ab5e470bca224718",
"assets/asset/muscle_map/fmale_glutes.jpg": "b425eeddf9d986009ef77c63b67ce3fa",
"assets/asset/muscle_map/female_shoulders.jpg": "92a9b47f4b9212c556d5bd3e3e1897e9",
"assets/asset/muscle_map/male_abs.jpg": "f02c74c025161e07ff7a43e5d9608361",
"assets/asset/muscle_map/female_front.jpg": "7d1eecafcb888754fb7d4823ef18395e",
"assets/asset/muscle_map/female_forearms.jpg": "e7feeb4d1214986d9f95df63fa4f3cc1",
"assets/asset/muscle_map/male_shoulders.jpg": "f40564d00b3b7a67e57f2d1e02a9661a",
"assets/asset/muscle_map/male_backs.jpg": "2b813dfefec19408e3dcbba730e653b4",
"assets/asset/muscle_map/female_triceps.jpg": "446e78968b25b18e712d004f784805d9",
"assets/asset/muscle_map/male_back.jpg": "b3fb8cf905b8554e3fd1facf4efcbbe1",
"assets/asset/muscle_map/male_glutes.jpg": "b9f515208ce0baaa1e1d10cce27cdd0b",
"assets/asset/muscle_map/male_calves.jpg": "48120423e44b13f80282b5338dcd0eaa",
"assets/asset/muscle_map/female_backs.jpg": "69aec04dcae7bdc1f817e5e122501238",
"assets/asset/muscle_map/male_biceps.jpg": "0df9459185ec79fc657bcfce3d7665d7",
"assets/asset/muscle_map/male_front.jpg": "881f317a54d444197a7357aa07956eb8",
"assets/asset/muscle_map/male_triceps.jpg": "52577d4ad33d25ea6e8befb45ecf423e",
"assets/asset/muscle_map/female_calves.jpg": "0922e2c5bd79f74bfe2848c99841bbd8",
"assets/asset/muscle_map/male_forearms.jpg": "a259709841953a90ca132c07371a656c",
"assets/asset/icon/bar_graph.png": "e5bc2ee6836753f6e1a88716d1158e54",
"assets/asset/workout2.jpg": "4784b9c5b6206115a16293ad5a5f5b87",
"assets/asset/workout4.jpg": "1b053e17d4083cdb6e55195ad07b7989",
"assets/asset/workout3.jpg": "6039f2ab762c569630225b8f1816c9f6",
"assets/asset/workout1.jpg": "8e53b463a350292bc2888ec6da381657",
"assets/asset/flankggg.gif": "8073741f432b140473f6865823d6433e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
