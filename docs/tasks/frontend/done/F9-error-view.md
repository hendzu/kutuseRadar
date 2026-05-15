# ErrorView.vue

Route: `/error`  
Shown when an unexpected server error occurs (navigated to via `NavigationService.navigateToErrorView()`).

## UI
- [ ] Heading: "Midagi läks valesti"
- [ ] Short message explaining an unexpected error occurred
- [ ] "Tagasi avalehele" button → navigates to `/`

## Logic
- [ ] No API calls — purely a static error page
- [ ] "Tagasi avalehele" button calls `NavigationService.navigateToHomeView()`