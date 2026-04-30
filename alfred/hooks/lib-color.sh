#!/usr/bin/env bash
# Ajan rengi — agent adına göre 256-color bg + beyaz fg, padded box
# Kullanım: source bu dosya; agent_box "code-agent" → "  code-agent  " renkli

agent_bg_color() {
  local name="$1"
  case "$name" in
    alfred|alfred:alfred) echo 53 ;;             # mor
    code-agent)           echo 27 ;;             # mavi
    research-agent)       echo 28 ;;             # yeşil
    test-agent)           echo 130 ;;            # turuncu
    debug-agent)          echo 124 ;;            # kırmızı
    review-agent)         echo 90 ;;             # koyu pembe
    architect-agent)      echo 17 ;;             # lacivert
    db-agent)             echo 94 ;;             # kahve
    deploy-agent)         echo 22 ;;             # koyu yeşil
    git-agent)            echo 166 ;;            # turuncu-kırmızı
    file-agent)           echo 240 ;;            # gri
    api-agent)            echo 25 ;;             # petrol
    plan-agent)           echo 54 ;;             # mor-koyu
    report-agent)         echo 60 ;;             # mavi-gri
    data-agent)           echo 30 ;;             # camgöbeği
    Explore)              echo 95 ;;
    Plan)                 echo 18 ;;
    general-purpose)      echo 240 ;;
    *)
      # bilinmeyen ajan: addan deterministik renk üret (16-231 arası)
      local h
      h=$(printf '%s' "$name" | cksum | awk '{print $1}')
      echo $(( 16 + (h % 215) ))
      ;;
  esac
}

agent_box() {
  local name="$1"
  local bg
  bg=$(agent_bg_color "$name")
  printf '\033[48;5;%sm\033[38;5;231m\033[1m %s \033[0m' "$bg" "$name"
}

alfred_header_box() {
  printf '\033[48;5;235m\033[38;5;215m\033[1m alfred \033[0m'
}

status_box() {
  # kullanım: status_box "DISPATCH" 178   (sarı)
  #          status_box "DONE" 28         (yeşil)
  local label="$1"
  local bg="$2"
  printf '\033[48;5;%sm\033[38;5;231m\033[1m %s \033[0m' "$bg" "$label"
}
