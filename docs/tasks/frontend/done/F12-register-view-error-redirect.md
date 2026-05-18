# RegisterView.vue — unknown error redirect (retrofit)

Retrofit task for the already-implemented [F3 RegisterView](F3-register-view.md).

## Logic
- [x] On submit: unknown/unexpected API errors (anything not explicitly handled) → `NavigationService.navigateToErrorView()`