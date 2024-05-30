#1.System Health Monitoring Script
import psutil
import os
from datetime import datetime

# Define thresholds
CPU_THRESHOLD = 80
MEM_THRESHOLD = 80
DISK_THRESHOLD = 80
LOG_FILE = "logfile.log"

def log_message(message):
    with open(LOG_FILE, 'a') as log:
        log.write(f"{datetime.now()}: {message}\n")

def check_cpu():
    cpu_usage = psutil.cpu_percent(interval=1)
    if cpu_usage > CPU_THRESHOLD:
        log_message(f"CPU usage is above threshold: {cpu_usage}%")
    else:
        log_message(f"CPU usage is within normal limits: {cpu_usage}%")

def check_memory():
    memory_info = psutil.virtual_memory()
    memory_usage = memory_info.percent
    if memory_usage > MEM_THRESHOLD:
        log_message(f"Memory usage is above threshold: {memory_usage}%")
    else:
        log_message(f"Memory usage is within normal limits: {memory_usage}%")

def check_disk():
    disk_usage = psutil.disk_usage('/').percent
    if disk_usage > DISK_THRESHOLD:
        log_message(f"Disk usage is above threshold: {disk_usage}%")
    else:
        log_message(f"Disk usage is within normal limits: {disk_usage}%")

def check_processes():
    running_processes = len(psutil.pids())
    log_message(f"Number of running processes: {running_processes}")

def main():
    check_cpu()
    check_memory()
    check_disk()
    check_processes()

if __name__ == "__main__":
    main()
