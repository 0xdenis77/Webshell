case $- in
  *i*) ;;
  *) return ;;
esac
 
trap '' INT TSTP QUIT
stty -ixon
 
BLACK="$(printf '\033[30m')"
RED="$(printf '\033[31m')"

GREEN="$(printf '\033[32m')"
YELLOW="$(printf '\033[33m')"
BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"
CYAN="$(printf '\033[36m')"
WHITE="$(printf '\033[37m')"
BRIGHT_WHITE="$(printf '\033[97m')"
RESET="$(printf '\033[0m')"
BOLD="$(printf '\033[1m')"
DIM="$(printf '\033[2m')"
BRIGHT_BLUE="$(printf '\033[92m')"
 
PASS="b3dedfe3605511d2a8e3e0f6ec32b8e1"
 
calc_md5() {
    if command -v md5sum >/dev/null 2>&1; then
        printf "%s" "$1" | md5sum | awk '{print $1}'
    elif command -v md5 >/dev/null 2>&1; then
        printf "%s" "$1" | md5 | awk '{print $1}'
    else
        printf "${RED}CRITICAL:${RESET} md5 utility not found\n"
        logout 2>/dev/null || exit
    fi
}
 
clear
sleep 0.1
 
printf "%s" "$BRIGHT_BLUE"
printf "╔══════════════════════════════════════════════════════════╗\n"
printf "║                                                          ║\n"
printf "║      ██████╗  █████╗ ██████╗ ██╗   ██╗██████╗  █████╗    ║\n"
printf "║     ██╔════╝ ██╔══██╗██╔══██╗██║   ██║██╔══██╗██╔══██╗   ║\n"
printf "║     ██║  ███╗███████║██████╔╝██║   ██║██║  ██║███████║   ║\n"
printf "║     ██║   ██║██╔══██║██╔══██╗██║   ██║██║  ██║██╔══██║   ║\n"
printf "║     ╚██████╔╝██║  ██║██║  ██║╚██████╔╝██████╔╝██║  ██║   ║\n"
printf "║      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ║\n"
printf "║                                                          ║\n"
printf "║              >>> GARUDA SECURITY <<<                     ║\n"
printf "║                    0xDenis77                             ║\n"
printf "║                                                          ║\n"
printf "╚══════════════════════════════════════════════════════════╝\n"
printf " \n"
printf " ══════════════════════════════════════════════════════════ \n"
printf "║                                                          ║\n"
printf "║  [>>] GARUDA SECURITY TERMINAL ACTIVE                    ║\n"
printf "║  [>>] ENCRYPTION: AES-256 BIT                            ║\n"
printf "║  [>>] SESSION ID: $(date +%s | md5sum | cut -c1-16)                       ║\n"
printf "║                                                          ║\n"
printf "╚══════════════════════════════════════════════════════════╝\n"
printf "%s\n" "$RESET"
 
MAX_TRY=3
TRY=0
 
while [ "$TRY" -lt "$MAX_TRY" ]; do
    TRY=$((TRY + 1))
 
    printf "\n${BRIGHT_BLUE}┌─[ACCESS REQUEST]${RESET}\n"
    printf "${BRIGHT_BLUE}└─╼${RESET} ${WHITE}Enter Password${DIM}: ${RESET}"
    stty -echo
    read passwd
    stty echo
    echo
 
    printf "${DIM}[${BRIGHT_BLUE}•${DIM}] ${BLUE}Authentication Sequence Initialized${RESET}\n"
 
    # Animasi scanning yang lebih futuristik
    printf "${DIM}   └─[ "
    for i in {1..20}; do
        printf "${BRIGHT_BLUE}■${DIM}"
        sleep 0.03
    done
    printf " ]${RESET}"
 
    printf "\r${DIM}   └─[${BRIGHT_BLUE}■■■■■■■■■■■■■■■■■■■■${DIM}]${RESET}\n"
    printf "${DIM}   └─[${BRIGHT_BLUE}✓${DIM}] Encryption Verification Complete${RESET}\n"
 
    HASH=$(calc_md5 "$passwd")
 
    if [ "$HASH" = "$PASS" ]; then
        printf "\n${BRIGHT_BLUE}[ACCESS GRANTED]${RESET} ${WHITE}Welcome to Garuda Security${RESET}\n"
        printf "${DIM}   └─[${BRIGHT_BLUE}✓${DIM}] Security Clearance: LEVEL 3${RESET}\n"
        break
    else
        printf "\n${RED}[ACCESS DENIED]${RESET} ${WHITE}Invalid credentials${RESET}\n"
        printf "${DIM}   └─[${RED}✗${DIM}] Attempt ${TRY}/${MAX_TRY}${RESET}\n"
 
        # Animasi error
        printf "${DIM}   └─[${RED}"
        for i in {1..3}; do
            printf "⚠ "
            sleep 0.2
        done
        printf "${DIM}]${RESET}\n"
        sleep 1
    fi
done
 
if [ "$TRY" -ge "$MAX_TRY" ]; then
    printf "\n${RED}╔══════════════════════════════════════════════════════════╗${RESET}\n"
    printf "${RED}║                   SYSTEM LOCKDOWN ACTIVATED              ║${RESET}\n"
    printf "${RED}║          Excessive authentication failures detected      ║${RESET}\n"
    printf "${RED}╚══════════════════════════════════════════════════════════╝${RESET}\n"
    sleep 2
    logout 2>/dev/null || exit
fi
 
printf "\n${BRIGHT_BLUE}╔══════════════════════════════════════════════════════════╗${RESET}\n"
printf "${BRIGHT_BLUE}║                   SYSTEM INITIALIZATION                  ║${RESET}\n"
printf "${BRIGHT_BLUE}╚══════════════════════════════════════════════════════════╝${RESET}\n"
 
# Animasi booting futuristik
boot_sequence=(
    "LOADING KERNEL MODULES"
    "INITIALIZING SECURITY PROTOCOLS"
    "MOUNTING ENCRYPTED VOLUMES"
    "ESTABLISHING SECURE CONNECTION"
    "LOADING USER ENVIRONMENT"
    "FINALIZING SYSTEM CHECK"
)
 
for i in "${!boot_sequence[@]}"; do
    printf "\n${DIM}[${BRIGHT_BLUE}•${DIM}] ${BLUE}${boot_sequence[$i]}${RESET}"
    sleep 0.15
    printf " ${DIM}["
    for j in {1..5}; do
        printf "${BRIGHT_BLUE}■${DIM}"
        sleep 0.05
    done
    printf "]${RESET}"
    printf "\r${DIM}[${BRIGHT_BLUE}✓${DIM}] ${WHITE}${boot_sequence[$i]}${RESET}"
done
 
printf "\n\n${BRIGHT_BLUE}╔══════════════════════════════════════════════════════════╗${RESET}\n"
printf "${BRIGHT_BLUE}║                    SYSTEM STATUS                         ║${RESET}\n"
printf "${BRIGHT_BLUE}╚══════════════════════════════════════════════════════════╝${RESET}\n"
 
# Informasi sistem dengan format hacker style
printf "\n${BLUE}┌─[SYSTEM METRICS]${RESET}\n"
 
# Memory
if command -v free >/dev/null 2>&1; then
    # Ambil data memory dalam KB
    read mem_total mem_used <<< $(free | awk '/^Mem:/ {print $2, $3}')
 
    # Hitung persentase menggunakan awk
    mem_percent=$(awk -v total="$mem_total" -v used="$mem_used" 'BEGIN {
        if (total > 0) {
            printf "%.1f", used * 100 / total
        } else {
            print "0.0"
        }
    }')
 
    # Human readable format
    mem_total_h=$(free -h | awk '/^Mem:/ {print $2}')
    mem_used_h=$(free -h | awk '/^Mem:/ {print $3}')
 
    printf "${BLUE}│${RESET} ${WHITE}MEMORY${DIM}:${RESET} ${BRIGHT_BLUE}${mem_used_h}${RESET}${DIM}/${RESET}${WHITE}${mem_total_h}${RESET} "
    printf "${DIM}["
 
    # Hitung bars (dibulatkan ke bawah)
    bars=$(( (${mem_percent%.*} * 20) / 100 ))
 
    # Gambar bar chart
    for ((i=0; i<20; i++)); do
        if [ $i -lt $bars ]; then
            printf "${BRIGHT_BLUE}▮"
        else
            printf "${DIM}▯"
        fi
    done
    printf "${RESET}${DIM}] ${mem_percent}%%${RESET}\n"
fi
# CPU
if command -v nproc >/dev/null 2>&1; then
    cpu_cores=$(nproc)
    printf "${BLUE}│${RESET} ${WHITE}PROCESSORS${DIM}:${RESET} ${BRIGHT_BLUE}${cpu_cores}${RESET} ${DIM}cores active${RESET}\n"
fi
 
# Disk
if command -v df >/dev/null 2>&1; then
    disk_used=$(df -h / | awk 'NR==2 {print $3}')
    disk_total=$(df -h / | awk 'NR==2 {print $2}')
    disk_percent=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    printf "${BLUE}│${RESET} ${WHITE}STORAGE${DIM}:${RESET} ${BRIGHT_BLUE}${disk_used}${RESET}${DIM}/${RESET}${WHITE}${disk_total}${RESET} "
    printf "${DIM}["
    bars=$((disk_percent/5))
    for ((i=0; i<20; i++)); do
        if [ $i -lt $bars ]; then
            printf "${BRIGHT_BLUE}▮${DIM}"
        else
            printf "${DIM}▯${RESET}"
        fi
    done
    printf "${DIM}] ${disk_percent}%%${RESET}\n"
fi
 
# Uptime
if command -v uptime >/dev/null 2>&1; then
    uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
    days=$((uptime_seconds/86400))
    hours=$((uptime_seconds%86400/3600))
    printf "${BLUE}│${RESET} ${WHITE}UPTIME${DIM}:${RESET} ${BRIGHT_BLUE}${days}${RESET}d ${BRIGHT_BLUE}${hours}${RESET}h\n"
fi
 
# Time
current_time=$(date '+%H:%M:%S')
current_date=$(date '+%Y-%m-%d')
printf "${BLUE}│${RESET} ${WHITE}TIME${DIM}:${RESET} ${BRIGHT_BLUE}${current_time}${RESET} ${DIM}|${RESET} ${WHITE}${current_date}${RESET}\n"
 
printf "${BLUE}└──────────────────────────────────────────────────────┘${RESET}"
 
# Pesan akhir dengan animasi
printf "\n\n${BRIGHT_BLUE}[>>]${RESET} ${WHITE}Session initialized successfully${RESET}\n"
printf "${DIM}   └─[${BRIGHT_BLUE}✓${DIM}] All systems operational${RESET}\n"
printf "${DIM}   └─[${BRIGHT_BLUE}✓${DIM}] Security protocols active${RESET}\n"
printf "${DIM}   └─[${BRIGHT_BLUE}✓${DIM}] Ready for command input${RESET}\n"
 
printf "\n${BRIGHT_BLUE}┌─[GARUDA SECURITY]-[USER:${RESET} ${WHITE}$(whoami)${BRIGHT_BLUE}]─[HOST:${RESET} ${WHITE}$(hostname)${BRIGHT_BLUE}]─[PATH:${RESET} ${WHITE}$(pwd)${BRIGHT_BLUE}]${RESET}\n"
printf "${BRIGHT_BLUE}└─╼${RESET} "
