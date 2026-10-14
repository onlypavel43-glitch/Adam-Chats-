#!/data/data/com.termux/files/usr/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
#  ADAM CHATS VIP — GUILD GLORY BOT
#  Author: Adam Chats Vip
# ═══════════════════════════════════════════════════════════════════════════

AUTHOR_NAME="Adam Chats Vip"
TOOL_NAME="ADAM CHATS GUILD GLORY BOT"
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
BOX_W=52
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
#  ১০ সেকেন্ডের প্রগ্রেস বার
# ---------------------------------------------------------------------------
wait_timer() {
    local sec=$1
    local msg="$2"
    local bar_w=25

    echo -e "${CYAN}${BOLD}  ⏳ $msg...${RESET}"
    for ((i=1; i<=sec; i++)); do
        local percent=$(( i * 100 / sec ))
        local filled=$(( i * bar_w / sec ))
        local empty=$(( bar_w - filled ))
        local bar=""
        for ((f=0; f<filled; f++)); do bar="${bar}█"; done
        for ((e=0; e<empty; e++)); do bar="${bar}░"; done

        printf "\r${YELLOW}  [%s] ${GREEN}%3d%% ${WHITE}(%ds/%ds)${RESET}" "$bar" "$percent" "$i" "$sec"
        sleep 1
    done
    echo -e "\n${GREEN}${BOLD}  ✅ সফল হয়েছে!${RESET}\n"
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
#  টেলিগ্রাম রিডাইরেক্ট
# ---------------------------------------------------------------------------
box_top
box_center "📢 OFFICIAL COMMUNITY" "$YELLOW"
box_line
box_left "🔗 আমাদের টেলিগ্রাম চ্যানেলে জয়েন করুন" "$WHITE"
box_left "📲 Telegram ওপেন করা হচ্ছে..." "$CYAN"
box_bot
echo ""

sleep 1
am start -a android.intent.action.VIEW -d "$TG_LINK" &>/dev/null
echo -e "${GREEN}${BOLD}  ✅ Telegram ওপেন হয়েছে! চ্যানেল জয়েন করে Termux-এ আসুন${RESET}"
echo -e "${CYAN}${BOLD}  ⏳ প্যাকেজ লোডিং শুরু হচ্ছে...${RESET}"
echo ""

# প্যাকেজ চেক লোডিং
wait_timer 5 "সিস্টেম ও প্যাকেজ লোড হচ্ছে"

# ---------------------------------------------------------------------------
#  মেইন মেনু (৫০K গিল্ড গ্লোরি)
# ---------------------------------------------------------------------------
box_top
box_center "🏆 গিল্ড গ্লোরি মেনু 🏆" "$YELLOW"
box_line
box_left "[1] 50K Guild Glory (৫০,০০০ গ্লোরি)" "$GREEN"
box_left "[0] Exit (বাহির হন)" "$RED"
box_bot
echo ""

read -p "👉 অপশন সিলেক্ট করুন [1]: " glory_choice

if [ "$glory_choice" != "1" ]; then
    echo -e "\n${RED}${BOLD}❌ প্রস্থান করা হলো!${RESET}\n"
    exit 0
fi

# ১ম ১০ সেকেন্ড লোড
echo ""
wait_timer 10 "গ্লোরি সার্ভার কানেকশন তৈরি হচ্ছে"

# ---------------------------------------------------------------------------
#  সার্ভার নির্বাচন
# ---------------------------------------------------------------------------
box_top
box_center "🌍 সার্ভার নির্বাচন করুন 🌍" "$YELLOW"
box_line
box_left "[1] Bangladesh (BD)" "$CYAN"
box_left "[2] India (IND)" "$GREEN"
box_left "[3] Pakistan (PK)" "$PINK"
box_left "[4] Nepal (NP)" "$YELLOW"
box_bot
echo ""

read -p "👉 আপনার সার্ভার সিলেক্ট করুন (1-4): " srv_choice

SERVER_NAME="Bangladesh (BD)"
case "$srv_choice" in
    1) SERVER_NAME="Bangladesh (BD)" ;;
    2) SERVER_NAME="India (IND)" ;;
    3) SERVER_NAME="Pakistan (PK)" ;;
    4) SERVER_NAME="Nepal (NP)" ;;
    *) echo -e "${YELLOW}⚠️ ডিফল্টভাবে Bangladesh (BD) সিলেক্ট করা হলো।${RESET}" ;;
esac

# ২য় ১০ সেকেন্ড লোড
echo ""
wait_timer 10 "$SERVER_NAME সার্ভার কনফিগার করা হচ্ছে"

# ---------------------------------------------------------------------------
#  গিল্ড ইউআইডি ইনপুট
# ---------------------------------------------------------------------------
box_top
box_center "🆔 গিল্ড ভেরিফিকেশন" "$YELLOW"
box_line
box_left "আপনার Free Fire গিল্ড ইউআইডি প্রদান করুন" "$WHITE"
box_bot
echo ""

read -p "👉 Enter Your Guild UID: " guild_uid

while [ -z "$guild_uid" ]; do
    echo -e "${RED}⚠️ গিল্ড ইউআইডি খালি রাখা যাবে না!${RESET}"
    read -p "👉 Enter Your Guild UID: " guild_uid
done

# ৩য় ১০ সেকেন্ড লোড
echo ""
wait_timer 10 "গিল্ড ডাটাবেসে গ্লোরি রিকোয়েস্ট পাঠানো হচ্ছে"

# ---------------------------------------------------------------------------
#  ফাইনাল ব্যানার (২৪ ঘণ্টা অপেক্ষা)
# ---------------------------------------------------------------------------
clear
echo ""
box_top
box_center "🎉 প্রসেসিং সফলভাবে সম্পন্ন হয়েছে! 🎉" "$GREEN"
box_line
box_left "📌 নির্বাচিত সার্ভার : $SERVER_NAME" "$CYAN"
box_left "📌 গিল্ড ইউআইডি      : $guild_uid" "$YELLOW"
box_left "📌 গ্লোরির পরিমাণ    : 50,000 (50K) Glory" "$GREEN"
box_line
box_center "⏳ দয়া করে ২৪ ঘণ্টা অপেক্ষা করুন! ⏳" "$RED"
box_left "আপনার গিল্ডে গ্লোরি যোগ হতে সর্বোচ্চ ২৪ ঘণ্টা" "$WHITE"
box_left "পর্যন্ত সময় লাগতে পারে।" "$WHITE"
box_left "ধৈর্য ধরে অপেক্ষা করুন এবং চ্যানেল ফলো রাখুন।" "$CYAN"
box_line
box_center "Powered by: $AUTHOR_NAME" "$PINK"
box_bot
echo ""