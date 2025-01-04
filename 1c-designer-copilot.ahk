#Requires AutoHotkey v2.0

SaveTextToFile(Path, Content) {
    File := FileOpen(A_ScriptDir Path, "w", "UTF-8")
    File.Write(Content)
    File.Close()
}

FileContent(Path) {
    File := FileOpen(A_ScriptDir Path, "r", "UTF-8")
    Content := File.Read(unset)
    File.Close()
    return Content
}

^1:: {

    ClipboardFilePath := "\temp\clipboard.txt"

    A_Clipboard := ""
    Send("^c")
    ClipWait(1, 1)
    Promt := A_Clipboard
    SaveTextToFile(ClipboardFilePath, Promt)

    ScriptPath := A_ScriptDir "\src\Модули\СкриптСозданияКода.os"
    Disk := "/c"
    RunWait("cmd " Disk " oscript " ScriptPath)

    A_Clipboard := FileContent(ClipboardFilePath)
    Send("^v")

}

^2:: {

    A_Clipboard := ""
    Send("^c")
    ClipWait(1, 1)
    Content := A_Clipboard
    SaveTextToFile("\temp\clipboard.txt", Content)

    ScriptPath := A_ScriptDir "\src\Модули\СкриптАнализаКода.os"
    Disk := "/c"
    RunWait("cmd " Disk " oscript " ScriptPath)

}
