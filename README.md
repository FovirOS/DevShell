# Introduction

This repository stores templates of dev shell.

# Usage

Please ensure that your NixOS has enabled `flake` features before running the following commands.

## Use Default Template

```bash
nix flake init -t github:FovirOS/DevShell
```

## Select a Specific Environment

```bash
nix flake init -t github:FovirOS/DevShell#<environment>
```

Replace `<environment>` with the specific environment name. For example, to use `Node.js` template, the command should be:

```bash
nix flake init -t github:FovirOS/DevShell#nodejs
```

The environments currently supported are:

| Name         | `<environment>` Value |
| ------------ | --------------------- |
| Node.js      | `nodejs`              |
| Front End    | `frontend`            |
| React + Vite | `react-vite`          |

## After Initialization

After initializing the template, it can be modified to meet the environment requirements. When everything is done, run the command to enter the `DevShell`.

```bash
nix develop
```
