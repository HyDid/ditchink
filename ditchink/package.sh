xcodebuild -workspace ditchink.xcworkspace -scheme ditchink archive -archivePath ./build/ditchink.xcarchive && \
rm -rf ./build/ditchink.ipa && \
xcodebuild -exportArchive -exportFormat ipa -archivePath build/ditchink.xcarchive -exportPath build/ditchink.ipa 
