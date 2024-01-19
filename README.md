# win-config

Repo containing configuration files for setting up my windows environment.

## Fonts

This uses the JetBrainsMono Nerd Font from [nerd fonts](https://www.nerdfonts.com/font-downloads)

### Install

- Extract the fonts from the archive.
- Select all
- Right-click and Install for all users.

### Configure Terminal

Go to the terminal settings and set the font for all the profiles (Profile -> Appearance -> Font face)

## Prompt

The prompt configuration uses [starship](https://starship.rs/guide/)

You can install starship with choco
`choco install starship`

### Config files

powershell script is `.\powershell\Microsoft.PowerShell_profile.ps1`
starship toml file is `.\starship\starship.toml`
