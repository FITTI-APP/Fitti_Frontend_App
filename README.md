# Fitti-Frontend-App

asset/config/ 안에 .env 파일 만들고 FOOK_API_KEY=키 값 추가해야 함
![image](https://github.com/FITTY-APP/Fitti-Frontend-App/assets/59111693/6e6e7107-dd9e-4c1f-8a6b-7f8174045979)



xcode 업데이트후 
```Uncategorized (Xcode): Command CodeSign failed with a nonzero exit code```
에러 발생시에는 아래의 코드입력하기
```
sudo arch -x86_64 gem install ffi
cd ios 
rm -rf build 
rm -rf Pods 
rm -rf Podfile.lock 
rm -rf ~/.pub-cache/hosted/pub.dartlang.org 
pod cache clean --all 
flutter clean 
flutter pub get 
arch -x86_64 pod repo update 
arch -x86_64 pod install
```