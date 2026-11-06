# DevOps Lab · Ansible

Provisioning practice with Ansible: two Docker containers act as servers, and an Ansible playbook installs Nginx on both and publishes a custom web page.

Part of my DevOps labs (Electiva 2).

## What it shows

- A **Dockerfile** that creates Ubuntu 24.04 "servers" with SSH, Python and an `ansible` user.
- **Docker Compose** that starts two of them, `node1` and `node2`.
- An **inventory** that groups both nodes as `webservers`.
- A **playbook** that, on each node:
  1. installs Nginx,
  2. copies `site/index.html` as the home page,
  3. makes sure Nginx is running and starts on boot.

## Tech stack

- **Ansible**
- **Docker** + **Docker Compose**
- **Ubuntu 24.04**
- **Nginx**
- **HTML / CSS** for the sample page

## Files

```
Dockerfile          Base image for the nodes
docker-compose.yml  Starts node1 and node2
inventory.ini       Ansible inventory
ansible.cfg         Ansible settings
playbook.yml        Installs and configures Nginx
site/index.html     Page served by Nginx
```

## Running it

1. Start the nodes:
   ```bash
   docker compose up -d --build
   ```
2. Run the playbook (from Linux or WSL with Ansible installed):
   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```
3. Open the page on each node:
   - node1: [http://localhost:8081](http://localhost:8081)
   - node2: [http://localhost:8082](http://localhost:8082)

| Node | SSH port | HTTP port |
| --- | --- | --- |
| node1 | 2222 | 8081 |
| node2 | 2223 | 8082 |

> The `ansible` / `ansible` credentials are only for this local lab.
