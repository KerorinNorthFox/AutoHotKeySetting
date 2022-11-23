; not used: b, y

; 消去キー
~vk1D & o:: Send, {BS}
~vk1D & p:: Send, {Del}

; 十字キー、Home,End,Escなど
~vk1D & h:: Send, {Left}
~vk1D & l:: Send, {Right}
~vk1D & k:: Send, {Up}
~vk1D & j:: Send, {Down}

~vk1D & u:: Send, {Home}
~vk1D & i:: Send, {End}
~vk1D & 1:: Send, {Esc}
~vk1D & Space:: Send, {Enter}
~vk1D & b:: Send, {Insert}
~vk1D & y:: Send, {PrintScreen}

; 音量操作
~vk1D & m:: Send, {Volume_Mute}
~vk1D & t:: Send, {Volume_Up}
~vk1D & g:: Send, {Volume_Down}

; マウス操作
~vk1D & e:: Send, {LButton}
~vk1D & q:: Send, {RButton}
~vk1D & f:: Send, {WheelDown}
~vk1D & r:: Send, {WheelUp}
~vk1D & c:: Send, {MButton}

; ブラウザ操作
~vk1D & z:: Send, !{Left}
~vk1D & x:: Send, !{Right}
~vk1D & v:: Send, ^{PgUp}
~vk1D & n:: Send, ^{PgDn}

; マウス移動ｓ
~vk1D & w::
if GetKeyState("Shift"){
    MouseMove 0, -60, 0, R
}
MouseMove 0, -10, 0, R
return

~vk1D & s::
if GetKeyState("Shift"){
    MouseMove 0, 60, 0, R
}
MouseMove 0, 10, 0, R
return

~vk1D & a::
if GetKeyState("Shift"){
    MouseMove -60, 0, 0, R
}
MouseMove -10, 0, 0, R
return

~vk1D & d::
if GetKeyState("Shift"){
    MouseMove 60, 0, 0, R
}
MouseMove 10, 0, 0, R
return
