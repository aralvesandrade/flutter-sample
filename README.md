# Cíngulo Flutter Sample

[Checkout some screenshots here.](https://github.com/cingulo/flutter-sample/tree/develop/screenshots)

A fully working sample Flutter app implementation. Give this repo a Star if you like it :)

- Layers separation (data, domain, logic, ui)
- Network calls and very simple caching and concurrency mechanism
- Generic error handling
- Forms validation
- Generic bloc structure
- RxDart
- Dependency injection
- Authentication with JWT and daily renewal
- Themes
- Multiple languages
- Named routes
- Named routes with parameters
- Analytics and pushes skeleton
- We have published [the API](https://api-sample.cingulo.com/docs) so that you can test the app
- Looks good but... it is still missing tests (TODO) :(

# Setup

This project uses [Google Inject library](https://github.com/google/inject.dart) so it's necessary to download all submodules.

- If you are cloning for the first time

```
    $ git clone --recurse-submodules -j8 https://github.com/cingulo/flutter-sample.git
```

- If you already clone but does not see submodules

```
    $ git submodule init
    $ git submodule update
```

- If that still does not work

```
    $ git submodule add https://github.com/google/inject.dart.git vendor/inject.dart
```

- At last, build the dependency injection

```
    $ flutter packages pub run build_runner build --delete-conflicting-outputs
```

- You can also use watch instead od build, but using watch is not necessary for most moments

```
    $ flutter packages pub run build_runner watch --delete-conflicting-outputs
```

- Done, you should now good to run the app.

# API Docs

Open [the docs URL](https://api-sample.cingulo.com/docs) in your browser. You can also check [the API GitHub repository](https://github.com/cingulo/api-sample).
