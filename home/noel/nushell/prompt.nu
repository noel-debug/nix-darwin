def create_left_prompt [] {
    # Shows "~" in home directory, or the current folder name elsewhere
    let dir = (
        if $env.PWD == $env.HOME {
            "~"
        } else {
            $env.PWD | path basename
        }
    )

    # Exact sampled colors
    let bg_dark = "#363f53"
    let fg_text = "#ffffff"
    let accent_purple = "#8c7ac8"

    # 1. Compact dark badge
    let segment = $"(ansi -e { fg: $fg_text, bg: $bg_dark }) ($dir) "

    # 2. First chevron: dark arrow pointing into purple
    let chevron1 = $"(ansi -e { fg: $bg_dark, bg: $accent_purple })\u{e0b0}"

    # 3. Second chevron: purple arrow pointing into terminal background
    let chevron2 = $"(ansi -e { fg: $accent_purple, bg: 'default' })\u{e0b0}(ansi reset)"

    $"($segment)($chevron1)($chevron2) "
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| "" }
$env.PROMPT_INDICATOR = {|| "" }
$env.PROMPT_INDICATOR_VI_INSERT = {|| "" }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "" }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }
