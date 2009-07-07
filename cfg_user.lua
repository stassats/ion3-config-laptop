dopath("mod_ionflux")
dopath("mpd")

defbindings("WMPlex", {
	       kpress("Mod4+r", "ioncore.exec_on(_, 'urxvtcd -e screen -dRR')"),
               kpress("Mod4+Mod1+r", "ioncore.exec_on(_, 'urxvtcd -e ssh slack -X')"),
	       kpress("Mod4+e", "ioncore.exec_on(_, 'emacs')"),
	       kpress("Mod4+f", "ioncore.exec_on(_, 'firefox')"),
	       kpress("Mod4+o", "ioncore.exec_on(_, 'opera')"),

	       kpress("Mod4+z", "dict_lookup(_)"),
	    })

function dict_lookup (ws)
   ioncore.request_selection(
      function (str)
	 local stream = io.popen("gosh ~/c/bin/idict "..str)
	 local string = ""

	 for line in stream:lines() do
	    string = string..line.."\n"
	 end
	 stream:close()

	 mod_query.message(ws, string)
      end)
end