#NoEnv
#SingleInstance Force
#Persistent
#InstallKeybdHook
#InstallMouseHook
; その行でコマンドを実行するごとに10ms自動sleepするところを、自動sleep無しで実行するようにする.
SetBatchLines, -1

global speed := 0

*vk1D::
    SetTimer, MoveMouse, 5
return

*vk1D Up::
    SetTimer, MoveMouse, Off
return

MoveMouse:
    ; 無変換が押されていないなら何もしない
    if !GetKeyState("vk1D", "P")
        return

    ; 移動速度[px]
    normalSpeed := 6
    maxSpeed := 20
    minSpeed := 3
    if GetKeyState("Shift", "P")
    {
        speed += 0.35
        if (speed > maxSpeed)
            speed := maxSpeed
    }
    else if GetkeyState("Ctrl", "P")
    {
        speed := minSpeed
    }
    else
    {
        speed := normalSpeed
    }

    dx := 0
    dy := 0

    if GetKeyState("w", "P")
        dy -= speed
    if GetKeyState("s", "P")
        dy += speed
    if GetKeyState("a", "P")
        dx -= speed
    if GetKeyState("d", "P")
        dx += speed

    ; 何も押されていなければ終了
    if (dx = 0 && dy = 0)
    {
        speed := normalSpeed
        return
    }


    ; 斜め移動の速度補正
    if (dx != 0 && dy != 0)
    {
        corr := 0.70710678
        dx *= corr
        dy *= corr
    }

    ; 小数を整数へ
    dx := Round(dx)
    dy := Round(dy)

    ; マウス移動
    DllCall("mouse_event"
        , "UInt", 0x0001   ; MOUSEEVENTF_MOVE
        , "Int", dx
        , "Int", dy
        , "UInt", 0
        , "UPtr", 0)

return

; 無変換キーを押している間wasdの入力を無効化
#If GetKeyState("vk1D", "P")

*w::return
*a::return
*s::return
*d::return

#If

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
