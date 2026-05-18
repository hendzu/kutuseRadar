# LoginView.vue — unknown error redirect (retrofit)

Retrofit task for the already-implemented [F2 LoginView](F2-login-view.md).

## Logic
- [x] On submit: unknown/unexpected API errors (anything not explicitly handled) → `NavigationService.navigateToErrorView()`