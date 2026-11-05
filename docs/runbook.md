# Runbook

## A process is stuck or using too much CPU
1. Find it: `ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head` (Linux) or `top -o cpu` (macOS)
2. Ask it to stop: `kill <PID>` (SIGTERM, lets it clean up)
3. Wait ~10 s. Only if it's still there: `kill -9 <PID>` (SIGKILL, no cleanup)

## "Address already in use" on a port
1. Find the owner: `sudo lsof -i :<port>` or `ss -ltnp | grep <port>` (Linux); `lsof -nP -iTCP:<port> -sTCP:LISTEN` (macOS)
2. Stop that process (see above), or run the app on another port.
