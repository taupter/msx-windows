ram_watch   add     0xC326      -type word       -desc currProcAddr      -format hex

ram_watch   add     0xC328      -type word       -desc nextAvaiProcAddr      -format hex

ram_watch   add     0xC01A      -type byte       -desc currTimeSec      -format hex
ram_watch   add     0xC019      -type byte       -desc currTimeMin      -format hex
ram_watch   add     0xC018      -type byte       -desc currTimeHour     -format hex


ram_watch   add     0xC32a      -type byte       -desc p0_id      -format hex
ram_watch   add     50773       -type byte       -desc p1_id      -format hex
ram_watch   add     51584       -type byte       -desc p2_id      -format hex
ram_watch   add     52395       -type byte       -desc p3_id      -format hex

# OS.processes: equ 0C32Ah ; last def. pass 3


# OS.currentProcessAddr: equ 0C326h ; last def. pass 3
# OS.nextAvailableProcessAddr: equ 0C328h ; last def. pass 3


# OS.currentTime_Seconds: equ 0C01Ah ; last def. pass 3
# OS.currentTime_Minutes: equ 0C019h ; last def. pass 3
