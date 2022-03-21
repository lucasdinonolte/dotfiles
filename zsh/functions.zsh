mksketch() {
  local tstamp="$(date +%Y%m%d_%H%M)"
  mkdir -p "$SKETCHES/sketch_$tstamp"
  cd "$SKETCHES/sketch_$tstamp"
  touch "sketch_$tstamp.pde"
  vim "sketch_$tstamp.pde"
}

mkprojectdirs() {
  mkdir '01 Orga'
  mkdir '02 Input'
  mkdir '03 Recherche'
  mkdir '04 Layout'
  mkdir '05 Produktion'
  mkdir '06 Präsentation'
}