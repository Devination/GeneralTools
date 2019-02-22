;; This is a simple collection of hotkeys designed for general use.
;; Author: Devin Curry
;; Developed with AHK 1.1.05.01
;;
;; Here is a table of contents:
;; * Paste File as Path: Ctrl + Shift + V
;; * Cycle Slashes Inline: Ctrl + Alt + /
;; * Type Out Clipboard: Win Key + V
;;
;; Then there are a few fun emoticons at the bottom.
;; Just type "/shrug" then 1 more character.
;;
;; Feel free to change or delete any of the hotkeys to your liking.

;;
;; Hotkeys
;; ! = Alt; ^ = Ctrl; + = Shift; # = Win Key

; Paste File as Path
^+v::
	; Store the actual file
	; FIXME: This part fails in the exe, disabling for now
	; Cache := ClipboardAll

	; Evaluate clipboard evaluated as string
	Path := Clipboard
	Clipboard := Path
	
	; Paste and restore actual file in clipboard
	Send, ^v
	; FIXME: This part fails in the exe, disabling for now
	; Clipboard := Cache
	return

; Cycle Slashes Inline
!^/::
	; Cycles between \\, \, and / in the current line of text.
	; Keeps old Clipboard but leaves the whole line selected so you can option to copy it.
	
	Cache := ClipboardAll
	Send, {Home}
	Send, +{End}
	Send, ^c
	Path := Clipboard
	if InStr(Path, "\\") {
		StringReplace, Path, Path, \\, \, All
	}
	else if InStr(Path, "\") {
		StringReplace, Path, Path, \\, /, All
		StringReplace, Path, Path, \, /, All
	}
	else {
		StringReplace, Path, Path, /, \\, All
	}
	Clipboard := Path
	Send, ^v
	Send, {Home}
	Send, +{End}
	Clipboard := Cache
	return
	
; Type Out Clipboard
#V::
	; Example use cases:
	; * Paste without formatting.
	; * Paste passwords when the widget only allows typing.
	; * Impress your mom with your fast typing.
	SendRaw, %Clipboard%
	return

; Reload this script - For development purposes
#+R::
	Reload
	return

;;
;; Type Emoticons - Just for fun
;;
; WARNING: If you're running the .ahk and these don't work. Make sure this file is saved as UTF-8-BOM

::/no::ಠ_ಠ

::/shrug::¯\_(ツ)_/¯

::/flip::(╯°□°)╯︵ ┻━┻

::/flip2::(┛◉Д◉)┛彡┻━┻

::/flip3::(ノಠ益ಠ)ノ彡┻━┻

::/lenny::( ͡° ͜ʖ ͡°)

::/why::щ(ﾟДﾟщ)
 
::/yay::ヽ(＾∇＾)ﾉ
