; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v2 on Tue Dec 25 2018 20:01:03 GMT-0600 (Central Standard Time)
; Modified 2 January 2019

M561                         	; clear any existing bed transform
G1 Z5 S2			; Move hot-end up (bed down) 5

; Probe the bed at 3 points, and perform 3-factor auto compensation
; Before running this, you should have set up your Z-probe trigger height to suit your build, 
; in the G31 command in config.g.
;
;G30 P0 X15 Y45 Z-99999		; probe near a leadscrew
G30 P0 X15 Y16 Z-99999		; probe near a leadscrew

;G30 P1 X15 Y275 Z-99999		; probe near a leadscrew
G30 P1 X15 Y266 Z-99999		; probe near a leadscrew

;G30 P2 X275 Y150 Z-99999 S3	; probe near a leadscrew and calibrate 3 motors
G30 P2 X275 Y139 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
G1 X0 Y0 F4000            	; move the head to the corner (optional)



; In default config - check for why not in default Railcore configs.
;
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)

;G29 S1; perform mesh bed leveling (or, with S1 load from heightmap.csv)
; G29   ; perform mesh bed leveling (or, with S1 load from heightmap.csv)