Config { font = "xft:Iosevka-12"
       , bgColor = "black"
       , fgColor = "white"
       , position = TopW L 90
       , allDesktops = True
       , commands = [ Run Battery ["-t", "<acstatus>: <left>%, <timeleft>",
                                   "--", "-O", "Charging", "-i", "Charging", "-o", "Discharging"] 10
                    , Run Volume "default" "Master" [] 10
                    , Run Cpu [] 10
		    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Mail
                      [ ("P: ", "~/mail/personal/Inbox")
                      , ("U: ", "~/mail/university/Inbox")
                      ] "mail"
		    , Run Date "%a %b %d %H:%M" "date" 10
		    , Run XMonadLog
		    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%XMonadLog%}\
        	    \{ %battery% | %default:Master% | %cpu% | %memory% | Mail <%mail%> | %date%"
       }
