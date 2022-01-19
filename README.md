# QuipTakeHome-Jeff

## Running Instructions

Since there are no added frameworks in this project, running is simple
- Open `QuipTakeHome.xcodeproj` in Xcode
- Compile and run the project within a simulator

## Future Improvements

As there was a request to not spend more than ~2 hours, there are many improvements which could be considered. The following is a list of potential improvements:
- Currently, to support the `http` calls for the images, I have allowed arbitrary loads. This could be improved to a specific exclusion list
- There is an assumption of the Curiosity rover within the networking layer due to time constraints. Allowing selection of `Opportunity` or `Spirit` as well as `Curiosity` would add to the functionality while only marginally adding complexity to the networking layer
- Additional networking calls to receive the date range of pictures for the selected rover is possible
  - This would allow for disabling the button when outside of the proper range
  - Alternatively, date range selection could be re-done to allow for only selections within the acceptable range
- A layer between `ViewModel` and `Network` objects could be implemented (I'll call them `Services` from here on)
  - A Service layer would make network changes in future simpler as they would only need to be updated in one place instead of every VM that implements the network call
  - A Service layer would make it easier to combine multiple network calls into one for a desired effect
  - A Service layer would allow encapsulation of logic managing the interplay between future local storage and network calls, making intelligently deciding when network calls are needed easier
- Using `AsyncImage` objects provided in iOS 15 allows for very simple image retrieval, as the UI object its self does the call to get the image from the URL
  - The negative of this is there is no image caching currently. Ideally the photo object would store the retrieved image and decide to use an async or sync image based on the image being pre-retrieved
- There is currently no paging available, allowing for only the first 25 images within a day to be displayed
  - This is again due to trying to remain within a reasonable amount of time given the constraints laid out before me.
