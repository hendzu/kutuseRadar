# NotAuthorizedView.vue

Route: `/forbiden`  
Shown when a user tries to access a protected page without being logged in (navigated to via `NavigationService.navigateToNotAuthorizedView()`).

## UI
- [ ] Heading: "Pole lubatud"
- [ ] Message explaining the user must be logged in to view this page
- [ ] "Logi sisse" button → navigates to `/login`

## Logic
- [ ] No API calls — purely a static page
- [ ] "Logi sisse" button calls `NavigationService.navigateToLoginView()` (add this method to NavigationService if missing)
- [ ] Views that require login should call `AuthService.isLoggedIn()` on mount and redirect here if false