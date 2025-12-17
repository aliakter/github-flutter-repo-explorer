Flutter GitHub Repository Explorer

A lightweight Flutter application that searches GitHub for repositories using the keyword "Flutter" and displays the top 50 most starred repositories with offline support.

Overview

This app demonstrates clean Flutter architecture, offline-first data handling, and modern state management. It fetches data from the GitHub Search API, caches it locally, and provides sorting and detailed views.

Features


⭐ Display Top 50 repositories by star count

🔄 Sort repositories by:

Star count

Last updated date-time

💾 Offline support (data available after app restart)

🖼 Cached images for offline viewing

🌙 Light / Dark theme support

📱 Responsive UI (mobile & tablet)

Tech Stack

Flutter

GetX – state management, routing, dependency injection

Hive – local data persistence

HTTP – API communication

cached_network_image – image caching