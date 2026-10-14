#!/data/data/com.termux/files/usr/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
#  ADAM CHATS VIP — License Key Generator & Setup
#  Author: Adam Chats Vip
# ═══════════════════════════════════════════════════════════════════════════

AUTHOR_NAME="Adam Chats Vip"
TOOL_NAME="ADAM CHATS VIP"
TG_LINK="https://t.me/adamchatsvip"

# ---------------------------------------------------------------------------
#  রঙ ও স্টাইল
# ---------------------------------------------------------------------------
RESET="\033[0m"
BOLD="\033[1m"
GREEN="\033[92m"
YELLOW="\033[93m"
CYAN="\033[96m"
RED="\033[91m"
WHITE="\033[97m"
PINK="\033[38;5;206m"
BOX_W=50
B="${PINK}${BOLD}"
RS="${RESET}"

# ---------------------------------------------------------------------------
#  UI ফাংশনসমূহ
# ---------------------------------------------------------------------------
box_top()  { echo -e "${B}╔$(printf '═%.0s' $(seq 1 $BOX_W))╗${RS}"; }
box_bot()  { echo -e "${B}╚$(printf '═%.0s' $(seq 1 $BOX_W))╝${RS}"; }
box_line() { echo -e "${B}╠$(printf '═%.0s' $(seq 1 $BOX_W))╣${RS}"; }

box_center() {
    local text="$1" color="${2:-$WHITE}"
    local clean; clean=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local tlen=${#clean}
    local lpad=$(( (BOX_W - tlen) / 2 ))
    local rpad=$(( BOX_W - tlen - lpad ))
    [ $lpad -lt 0 ] && lpad=0
    [ $rpad -lt 0 ] && rpad=0
    printf "${B}║${RS}%${lpad}s${color}${BOLD}%s${RS}%${rpad}s${B}║${RS}\n" "" "$text" ""
}

box_left() {
    local text="$1" color="${2:-$WHITE}"
    local clean; clean=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local pad=$(( BOX_W - ${#clean} - 2 ))
    [ $pad -lt 0 ] && pad=0
    printf "${B}║${RS} ${color}${BOLD}%s${RS}%${pad}s${B}║${RS}\n" "$text" ""
}

# ---------------------------------------------------------------------------
#  লোডিং ও প্রগ্রেস বার ফাংশন
# ---------------------------------------------------------------------------
show_progress() {
    local total_sec=$1
    local title="$2"
    local bar_w=28

    echo -e "${CYAN}${BOLD}  ⏳ $title...${RESET}"
    for ((i=1; i<=total_sec; i++)); do
        local percent=$(( i * 100 / total_sec ))
        local filled=$(( i * bar_w / total_sec ))
        local empty=$(( bar_w - filled ))
        local bar=""
        for ((f=0; f<filled; f++)); do bar="${bar}█"; done
        for ((e=0; e<empty; e++)); do bar="${bar}░"; done

        printf "\r${YELLOW}  [%s] ${GREEN}%3d%% ${WHITE}(%ds/%ds)${RESET}" "$bar" "$percent" "$i" "$total_sec"
        sleep 1
    done
    echo -e "\n${GREEN}${BOLD}  ✅ প্রসেস সফলভাবে শেষ হয়েছে!${RESET}\n"
}

# ---------------------------------------------------------------------------
#  র‍্যান্ডম লাইসেন্স কি তৈরি করার ফাংশন
# ---------------------------------------------------------------------------
generate_random_key() {
    local w1=("server" "cloud" "node" "alpha" "speed" "vortex")
    local w2=("maid" "nexus" "core" "pulse" "prime" "shield")
    local w3=("hader" "titan" "guard" "sonic" "blade" "matrix")

    local r1=${w1[$RANDOM % ${#w1[@]}]}
    local r2=${w2[$RANDOM % ${#w2[@]}]}
    local r3=${w3[$RANDOM % ${#w3[@]}]}
    local num=$(printf "%04d" $((RANDOM % 9000 + 1000)))
    
    # ২ অক্ষরের র‍্যান্ডম স্ট্রিং
    local letters="abcdefghijklmnopqrstuvwxyz"
    local c1=${letters:$((RANDOM % 26)):1}
    local c2=${letters:$((RANDOM % 26)):1}

    echo "${r1}-${r2}-${r3}-${num}-${c1}${c2}"
}

# ---------------------------------------------------------------------------
#  হেডার ব্যানার
# ---------------------------------------------------------------------------
clear
box_top
box_center "⚡ $TOOL_NAME ⚡" "$YELLOW"
box_center "Created by: $AUTHOR_NAME" "$CYAN"
box_bot
echo ""

# ---------------------------------------------------------------------------
#  টেলিগ্রাম চ্যানেল ওপেন
# ---------------------------------------------------------------------------
box_top
box_center "📢 $TOOL_NAME COMMUNITY" "$YELLOW"
box_line
box_left "🔗 আমাদের টেলিগ্রাম চ্যানেলে জয়েন করুন" "$WHITE"
box_left "📲 Telegram ওপেন করা হচ্ছে..." "$CYAN"
box_bot
echo ""

sleep 1
am start -a android.intent.action.VIEW -d "$TG_LINK" &>/dev/null
echo -e "${GREEN}${BOLD}  ✅ Telegram ওপেন হয়েছে! চ্যানেল জয়েন করে টার্মাক্সে আসুন${RESET}"
echo -e "${CYAN}${BOLD}  ⏳ ৪ সেকেন্ড অপেক্ষা করা হচ্ছে...${RESET}"
sleep 4
echo ""

# ---------------------------------------------------------------------------
#  মেইন মেনু
# ---------------------------------------------------------------------------
box_top
box_center "🔑 লাইসেন্স কি সিস্টেম 🔑" "$YELLOW"
box_line
box_left "[1] Generate Your License Key" "$GREEN"
box_left "[0] Exit" "$RED"
box_bot
echo ""

read -p "👉 অপশন সিলেক্ট করুন [1]: " main_choice

if [ "$main_choice" != "1" ]; then
    echo -e "\n${RED}${BOLD}❌ প্রস্থান করা হলো!${RESET}\n"
    exit 0
fi

# প্রথম লোডিং (৩৫ সেকেন্ড)
echo ""
show_progress 35 "সার্ভারের সাথে কানেক্ট এবং ইনিশিয়ালাইজ করা হচ্ছে"

# ---------------------------------------------------------------------------
#  সাব-মেনু (অফিশিয়াল / আনঅফিশিয়াল)
# ---------------------------------------------------------------------------
box_top
box_center "⚙️ কি ক্যাটাগরি বেছে নিন ⚙️" "$YELLOW"
box_line
box_left "[1] Official Key" "$CYAN"
box_left "[2] Unofficial Key" "$PINK"
box_bot
echo ""

read -p "👉 আপনার পছন্দ নির্বাচন করুন (1 অথবা 2): " sub_choice

KEY_TYPE=""
if [ "$sub_choice" = "1" ]; then
    KEY_TYPE="Official Key"
elif [ "$sub_choice" = "2" ]; then
    KEY_TYPE="Unofficial Key"
else
    echo -e "\n${RED}${BOLD}⚠️ ভুল ইনপুট! ডিফল্টভাবে Unofficial Key নির্বাচন করা হলো।${RESET}"
    KEY_TYPE="Unofficial Key"
fi

# দ্বিতীয় লোডিং (২০ সেকেন্ড)
echo ""
show_progress 20 "$KEY_TYPE জেনারেট হচ্ছে"

# কি তৈরি
GENERATED_KEY=$(generate_random_key)

# ---------------------------------------------------------------------------
#  রেজাল্ট বক্স
# ---------------------------------------------------------------------------
box_top
box_center "🎉 লাইসেন্স কি তৈরি সম্পন্ন! 🎉" "$GREEN"
box_line
box_left "টাইপ : $KEY_TYPE" "$YELLOW"
box_left "কি   : $GENERATED_KEY" "$CYAN"
box_line
box_center "Developed by: $AUTHOR_NAME" "$WHITE"
box_bot
echo ""