# SSH

Scripts and configuration for the **SSH** project — connecting to a remote
server securely using key-based authentication instead of passwords.

## Background

SSH (Secure Shell) lets you log in to a remote machine over an encrypted
channel. Instead of a password we use an **RSA key pair**:

- a **private key** (`~/.ssh/school`) that never leaves your machine, and
- a **public key** (`school.pub`) that is placed on the server.

The server encrypts a challenge with your public key; only the matching
private key can answer it — so you prove your identity without ever sending a
secret over the wire.

## Tasks

| File | Description |
|------|-------------|
| `0-use_a_private_key` | Bash script that connects to the server as `ubuntu` using the private key `~/.ssh/school`. |
| `1-create_ssh_key_pair` | Bash script that generates a 4096-bit RSA key pair named `school`, protected by the passphrase `betty`. |
| `2-ssh_config` | SSH client config: always use `~/.ssh/school`, never fall back to password authentication. |
| `100-puppet_ssh_config.pp` | The same client configuration as task 2, applied with Puppet (`file_line` from `puppetlabs-stdlib`). |

### "Let me in!" — server-side task (no file)

Add a given public key to the server's `~/.ssh/authorized_keys` for the
`ubuntu` user so another party can connect:

```bash
mkdir -p ~/.ssh && chmod 700 ~/.ssh
echo "ssh-rsa AAAA...== their-key" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

## Usage

```bash
# generate your key pair
./1-create_ssh_key_pair

# move the private key into place (once)
mv school ~/.ssh/school && mv school.pub ~/.ssh/school.pub

# connect
./0-use_a_private_key
```

## Requirements

- Ubuntu 20.04 LTS
- All Bash scripts start with `#!/usr/bin/env bash` and pass
  [ShellCheck](https://www.shellcheck.net/)
