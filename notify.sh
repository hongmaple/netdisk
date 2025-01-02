#!/bin/bash

# 通用通知脚本
function notify() {
    local subject="$1"
    local body="$2"
    local method="$3"

    case "$method" in
        email)
            send_email "$subject" "$body"
            ;;
        dingtalk)
            send_dingtalk "$subject" "$body"
            ;;
        *)
            echo "Unknown notification method: $method"
            exit 1
            ;;
    esac
}

# 发送邮件
function send_email() {
    local subject="$1"
    local body="$2"

    SMTP_SERVER="smtp.example.com"
    SMTP_PORT="587"
    SMTP_USERNAME="your-email@example.com"
    SMTP_PASSWORD="your-password"
    FROM_EMAIL="your-email@example.com"
    TO_EMAIL="recipient@example.com"

    LOG_FILE="/data/logs/notify.log"

    echo -e "$body" | mailx -s "$subject" -S smtp="$SMTP_SERVER:$SMTP_PORT" -S smtp-use-starttls=yes -S smtp-auth=login -S smtp-auth-user="$SMTP_USERNAME" -S smtp-auth-password="$SMTP_PASSWORD" -r "$FROM_EMAIL" "$TO_EMAIL"

    if [ $? -eq 0 ]; then
        echo "$(date) - Email sent successfully to $TO_EMAIL" >> $LOG_FILE
    else
        echo "$(date) - Failed to send email to $TO_EMAIL" >> $LOG_FILE
    fi
}

# 发送钉钉通知
function send_dingtalk() {
    local subject="$1"
    local body="$2"

    DINGTALK_WEBHOOK_URL="https://oapi.dingtalk.com/robot/send?access_token=970d9b713c43a317baad072c2b7d36b515c1e6ac27e3b1e7ea0a923eaa82daaf"

    JSON_PAYLOAD=$(cat <<EOF
{
    "msgtype": "text",
    "text": {
        "content": "$subject\n$body"
    }
}
EOF
)

    LOG_FILE="/data/logs/notify.log"

    response=$(curl -X POST -H 'Content-Type: application/json' --data "$JSON_PAYLOAD" "$DINGTALK_WEBHOOK_URL")

    if [ $? -eq 0 ]; then
        echo "$(date) - DingTalk message sent successfully" >> $LOG_FILE
    else
        echo "$(date) - Failed to send DingTalk message" >> $LOG_FILE
    fi
}

# 主函数
main() {
    local subject="$1"
    local body="$2"
    local method="$3"

    notify "$subject" "$body" "$method"
}

# 检查参数
if [ $# -ne 3 ]; then
    echo "Usage: $0 <subject> <body> <method>"
    exit 1
fi

# 调用主函数
main "$@"