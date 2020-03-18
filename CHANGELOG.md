## 1.1.1

- Fix image upload by [yudaprama](https://github.com/yudaprama)

## 1.1.0

- BREAKING CHANGE: Services no longer return a BaseResponse or BaseResponseList instance but directly the content
- Reformat code to follow dart standards
- Rename deletehash field to deleteHash in GalleryImage, Image and Album classes.

## 1.0.21

- Add uploadImage and uploadVideo methods to Image service
- Add searchSuggestions to Gallery service
- Add associate method to Account service
- Add upload_image example

## 1.0.2

- Change GalleryImage accountUrl field type from int to String
- Add error handling for null input in baseModelListToJson method
- Add some unit tests
- Add getVotes and vote methods to image and album services
- Add favoriteCount, tags and hasSound to Image and Album models
- Add headers getter to Authentication class

## 1.0.1

- Minor fixes based on pub.dev suggestions

## 1.0.0

- Initial version
