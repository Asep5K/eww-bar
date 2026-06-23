#!/bin/bash
thumb_dir="${XDG_CONFIG_HOME:-$HOME/.config}/eww/bar/thumbs"
defautl_thumbnail="$XDG_CONFIG_HOME/hypr/wallpaper/1.jpg"
a() {
    printf '{"title": "%s", "artist": "%s", "thumbnail": "%s", "length": 0, "status": "%s"}\n' \
        "$USER" "$USER" "$defautl_thumbnail" "None"

    playerctl metadata --follow --format '{{artist}}|{{title}}|{{mpris:artUrl}}|{{mpris:length}}|{{status}}' |
        while IFS='|' read -r artist title arturl length status; do
            [ -z "$title" ] && continue

            if [[ -n "$length" && "$length" =~ ^[0-9]+$ ]]; then
                len_sec=$(((length + 500000) / 1000000))
            else
                len_sec=0
            fi

            if [ -z "$arturl" ]; then
                arturl="$defautl_thumbnail"
            elif [[ "$arturl" =~ ^file:// ]]; then
                arturl="${arturl#file://}"
            elif [[ "$arturl" =~ ^https?:// ]]; then
                url_hash=$(printf "%s" "$arturl" | md5sum | cut -d' ' -f1)
                local_thumb="${thumb_dir}/${url_hash}.png"

                if [ ! -f "$local_thumb" ]; then
                    (curl -sL "$arturl" -o "$local_thumb" &)
                    arturl="$defautl_thumbnail"
                else
                    arturl="$local_thumb"
                fi
            fi

            printf '{"title": "%s", "artist": "%s", "thumbnail": "%s", "length": %d, "status": "%s"}\n' \
                "$title" "$artist" "$arturl" "$len_sec" "$status"
        done
}
b() {
    playerctl metadata -F -f '{{position}}|{{mpris:length}}' | while IFS='|' read -r position length; do
        pos_sec=$(((position + 500000) / 1000000))
        printf '{"position":%d,"positionStr":"%d:%02d"}\n' \
            "$pos_sec" $((pos_sec / 60)) $((pos_sec % 60))
    done
}
$1
