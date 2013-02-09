" Tabularize patterns for only matching the first equal sign
if exists(':Tabularize')
  AddTabularPattern! 1=    /^[^=]*\zs=
  AddTabularPattern! 1'    /^[^']*\zs'
  AddTabularPattern! 1"    /^[^"]*\zs"
  AddTabularPattern! 1:    /^[^:]*\zs:
  AddTabularPattern! 1==   /^[^=]*\zs=/r0c0l0
endif
