# ░█▀▄░█░░░█▀█░█▀▀░█░█░█▀▀
# ░█▀▄░█░░░█░█░█░░░█▀▄░▀▀█
# ░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

# Time stamp block
function _block_time_stamp -d 'Returns time stamp block'
	set block (set_color -b brcyan -o black)' '(date +%H:%M)' '
	echo $block
end

# Status block
function _block_status -d 'Returns status block'
	if test $prev_status -ne 0
		set block (set_color -b red -o yellow)' '$prev_status' '
	else
		set block (set_color -b black -o green)' ✔ '
	end
	echo $block
end

# Git block
function _block_git -d 'Returns Git block'
	if [ (fish_git_prompt) ]
		set git_bg (_fishblocks_git_status)
		set block (fish_git_prompt)'  '
	else
		set git_bg normal
		set block (fish_git_prompt)
	end
	echo (set_color -b $git_bg black) $block
end

# Conda block
function _block_conda -d 'Return Conda block'
	if test -n $CONDA_DEFAULT_ENV
		set block (set_color -b blue black)' '$CONDA_DEFAULT_ENV' '
	else
		set block
	end
	echo $block
end

# Private mode block
function _block_private -d 'Returns private mode block'
	if  not test -z $fish_private_mode
		set block (set_color -b black white)' 﫸'
	else
		set block
	end
	echo $block
end

# ░█▀▄░▀█▀░█▀▀░█░█░▀█▀░░░░░█░█░█▀█░█▀█░█▀▄░░░█▀█░█▀▄░█▀█░█▄█░█▀█░▀█▀
# ░█▀▄░░█░░█░█░█▀█░░█░░▄▄▄░█▀█░█▀█░█░█░█░█░░░█▀▀░█▀▄░█░█░█░█░█▀▀░░█░
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░░▀░░░░░░▀░▀░▀░▀░▀░▀░▀▀░░░░▀░░░▀░▀░▀▀▀░▀░▀░▀░░░░▀░

# Right-hand prompt
function fish_right_prompt -d 'Right-hand prompt'
	echo -ne (_block_status)(_block_git)(_block_conda)(_block_time_stamp)(_block_private)(set_color normal)
end
