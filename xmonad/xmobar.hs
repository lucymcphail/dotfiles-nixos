Config { font = "xft:Iosevka-10"
       , border = NoBorder
       , bgColor = "black"
       , fgColor = "white"
       , alpha = 255
       , position = Top
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , textOutputFormat = Ansi
       , commands = [ Run Battery ["-t", "<acstatus>: <left>%, <timeleft>",
                                   "--", "-O", "Charging", "-i", "Charging", "-o", "Discharging"] 10
                    , Run Volume "default" "Master" [] 10
                    , Run Cpu [] 10
		    , Run Memory ["-t","Mem: <usedratio>%"] 10
		    , Run Date "%a %b %d %H:%M" "date" 10
		    , Run XMonadLog
		    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%XMonadLog%}\
        	    \{ %battery% | %default:Master% | %cpu% | %memory% | %date%"
       }
