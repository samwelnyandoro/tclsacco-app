run:
		flutter run

emu:
		flutter emulators --launch Nexus_5X_API_29_x86

fmt:
		flutter format lib

mods:
		flutter packages run build_runner build --delete-conflicting-outputs

apk:
		flutter build apk

aab:
		flutter build appbundle

icon:
		flutter pub run flutter_launcher_icons:main