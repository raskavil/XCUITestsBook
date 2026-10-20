---
chapter: 02-uikit-introduction
title: Log the Test Device
abstract: Make TaskBoard print which simulator and iOS version it runs on, so every console log says where it came from.
minutes: 15
difficulty: warm-up
order: 1
starter: 02-uikit-introduction/SceneDelegate-02.swift
solution: 02-uikit-introduction/SceneDelegate-solution.swift
doneWhen:
  - "On launch, the console shows one line like `TaskBoard started on iPhone 16, iOS 18.2`."
  - Running on two different simulators prints two different device names.
  - The iOS version in the line matches the one in the run destination menu.
  - The window setup above the `print` is unchanged.
hints:
  - "`UIDevice.current` describes the device the app runs on. Option-click it and browse its properties for the system version."
  - "On a simulator, the device name you picked is available as an environment variable called `SIMULATOR_DEVICE_NAME`. `ProcessInfo.processInfo.environment` is a dictionary of those variables."
  - "Reading a dictionary gives you an optional. Use `??` with `UIDevice.current.model` as the fallback, so the line still works on a real device."
quiz:
  question: Why include the device and iOS version in a log line?
  options:
    - Xcode needs it to run the app
    - A bug can depend on the device or system version, so a log without them is incomplete
    - It makes the app start faster
  answer: 1
  explanation: The same steps can pass on one simulator and fail on another. Logs, like bug reports, need the environment to be useful.
---

When you start running TaskBoard on several simulators, console output from different runs looks identical. A tester reading a pasted log cannot tell whether it came from a small iPhone on an older iOS or the newest model.

Change the launch line so it says exactly where the app is running: the simulator’s name and the iOS version.

The line must be printed once per launch, and the app must still start on the Login screen.
