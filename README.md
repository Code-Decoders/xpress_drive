![Screenshot_20220305-173010(3)](https://user-images.githubusercontent.com/22388017/156882234-c4ed772d-555f-47ca-a7c8-53350a7d5361.jpg)

# Xpress Drive

A decentralised and end to end encrypted cloud storage solution built on IPFS(InterPlanetary File System).

### Get the application on:
 <a href="https://play.google.com/store/apps/details?id=com.codedecoders.xpress_drive"><img src="https://user-images.githubusercontent.com/22388017/157868292-a481ed09-fa25-47f5-880d-1cfd4078afd9.png" width="280" height="108"/></a>
 
---

### `Feature List`
1. Login/Register.
2. Upload encrypted files on **IPFS by using a private key**(only visible to you, making it super secure).
3. All File Formats Supported: New files, Downloads, Videos, Audios, Images, Apps, Docs and Archives.
4. Download/view files.
5. Delete files.
6. Toggle between list and grid view.

---

### `Tech Stack`
* <img src="https://user-images.githubusercontent.com/22388017/157873532-6287ed4a-e305-4ba8-9879-b315cc7104fa.png" width="24" height="24"/>  Flutter (Frontend)
* <img src="https://user-images.githubusercontent.com/22388017/157877387-6306a173-30de-47ad-9fe7-d6195cb67146.png" width="24" height="24"/> IPFS
* <img src="https://user-images.githubusercontent.com/22388017/157877387-6306a173-30de-47ad-9fe7-d6195cb67146.png" width="24" height="24"/> Figma (UI Design)



--- 

### `Libraries Used`
The important libraries we used to make this projects are,

* [ipfs_client_flutter](https://pub.dev/packages/ipfs_client_flutter) : We have developed this library from scratch to call [HTTP RPC API](https://docs.ipfs.io/reference/http/api/).

* [file_cryptor](https://pub.dev/packages/file_cryptor): Aes encryption and decryption of files.
* [biometric_storage](https://pub.dev/packages/biometric_storage): Login into app using fingerprint. 

--- 

### `Project's value for the IPFS ecosystem or developer community`
Xpress Drive provides and encrypted and decentralised solution to the users, i.e. a user first encrypts a File using a private key then uploads it into IPFS. At the time of retrival only he can view the files using the private key. 

--- 

### `Steps to run the project`
### `Step 0:`
Download android stuido and make sure to setup [flutter](https://docs.flutter.dev/get-started/install) in your system.
### `Step 1:`
Once everything is step up, run `flutter pub get`
### `Step 1:`
run `flutter run`

# That's all folks!! have a good day! :coffee:
