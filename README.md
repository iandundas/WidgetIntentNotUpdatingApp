# Basic example 

_(more details below)_

Showing that changes saved to SwiftData from a Widget AppIntent are not reflected in the main app.

- Changes made in the app DO show up in the widget ✅
- Changes made in the widget DO NOT show up in the app ❌

https://github.com/iandundas/WidgetIntentNotUpdatingApp/assets/1131967/b6636fd6-9f8d-4f92-9eee-5ef99a38757a

# TSI as submitted to Apple:

**PLATFORM AND VERSION**
iOS
Xcode 15.0.0 + iOS 17.0 (Simulator) and iPhone XR on iOS 17.0 (21A329).

**DESCRIPTION OF PROBLEM**
- I have a basic iOS SwiftData app, based on the Xcode template, with an Interactive Widget added.
- They use a shared App Group to share the data container.
- When a Model is updated in the main app UI, it is reflected in an updated Widget. That works!
- When a Model is updated via an Interactive Widget (using an AppIntent), that also works! I see the change reflected in the widget, and also in the SQLite file. The change is saved.

The problem, however, is that I cannot see this change in the main app when I foreground the app again.

The only way to see the new data is to force-quit the app and relaunch - and then I see the update.

I have tried using only the `.mainContext`, I have tried creating my own local Contexts both for reading and for writing, I have tried explicitly saving, I have tried letting it autosave. I have tried using @Query to automatically fetch the data, and I have tried manually fetching new data once the app comes to the foreground. In all cases I get stale data - it is as if the AppIntent had never been triggered.

Using the debugger I see that the expected paths are all followed, and no errors are thrown.

**STEPS TO REPRODUCE**
I have a sample repo here, and the README has a video showing what happens:
https://github.com/iandundas/WidgetIntentNotUpdatingApp


In the video you see:

- Starting state: the widget reads "false" - untoggled.
- The app is used to toggle the boolean to "true". In the app it displays "true".
- Minimising the app again, the Widget correctly reads "true". This is correct.
- Tapping the button in the Widget, the Widget now reads "false".

So far so good.

- Opening the app back up, it still reads "true". This is not correct.


**Steps to reproduce:**

- Clone the project linked above.
- Change the bundle ID and App Groups of the App Target and WidgetExtension, so that you're able to run it.
- On device/simulator, add the TapTapTest Widget to the Home Screen.
- Run the app, and interact with the Toggle button
- Minimise the app, and interact with the Widget
- Open the app up, and see that the change made in the Widget has not propagated.
